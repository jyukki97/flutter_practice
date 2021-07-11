import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:firebase/firebase.dart" as fb;
import 'dart:html';

import 'package:web/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrentUser>(
      create: (context) => userStream(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ProfilePage(),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _currentUser = Provider.of<CurrentUser>(context);
    if (_currentUser == null) return Center(child: CircularProgressIndicator());
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            ProfilePicture(),
            SizedBox(height: 20),
            OutlineButton(
              onPressed: () {
                uploadToStorage(_currentUser);
              },
              child: Text('Update Profile Picture'),
            ),
            SizedBox(height: 100,),
            OutlinedButton(
              onPressed: (){
                print("button");
                print(downloadtxt("custom.txt").asStream().toList().then((list) => (list)));
              },
              child: Text("upload Text"),
            )
          ],
        ),
      ),
    );
  }
}

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _currentUser = Provider.of<CurrentUser>(context);
    if (_currentUser == null) return Center(child: CircularProgressIndicator());

    return StreamBuilder<Uri>(
      stream: downloadUrl(_currentUser.photoUrl).asStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return CircleAvatar(
          radius: 48,
          child: Image.network(snapshot.data.toString()),
        );
      },
    );
    // return CircleAvatar(
    //   radius: 48,
    //   child: Icon(
    //     Icons.people_alt_rounded,
    //   ),
    // );
  }
}

Stream<CurrentUser> userStream() {
  return FirebaseFirestore.instance
      .collection('users')
      .doc('mFvpSgSohmEM0AIrjjqQ')
      .snapshots()
      .map((doc) => CurrentUser.fromDoc(doc));
}

Future<Uri> downloadUrl(String photoUrl) {
  return fb
      .storage()
      .refFromURL('gs://speedy-cab-309506.appspot.com')
      .child(photoUrl)
      .getDownloadURL();
}

void uploadImage({@required Function(File file) onSelected}) {
  InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
  uploadInput.click();

  uploadInput.onChange.listen((event) {
    final file = uploadInput.files.first;
    final reader = FileReader();
    reader.readAsDataUrl(file);
    reader.onLoadEnd.listen((event) {
      onSelected(file);
    });
  });
}

void uploadToStorage(CurrentUser user) {
  final dateTime = DateTime.now();
  final userId = user.id;
  final path = '$userId/$dateTime';
  uploadImage(
    onSelected: (file) {
      fb
          .storage()
          .refFromURL('gs://speedy-cab-309506.appspot.com')
          .child(path)
          .put(file)
          .future
          .then((_) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.id)
            .update({'photo_url': path});
      });
    },
  );
}

Future downloadtxt(String txt) async {
  return await downloadUrl(txt);
}