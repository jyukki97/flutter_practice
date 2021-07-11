import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameHolder = TextEditingController();
  List<dynamic> wordList = List<dynamic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Text("사전 입력하기",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(20),
            child: TextField(
              textAlign: TextAlign.center,
              controller: nameHolder,
              onSubmitted: (word){
                FirebaseFirestore.instance
                    .collection('users')
                    .doc('mFvpSgSohmEM0AIrjjqQ')
                    .update({"word": FieldValue.arrayUnion([word])});
                nameHolder.clear();
                print(word);
              },
              maxLines: 1,
            ),
          ),
          OutlinedButton(
              onPressed: (){
                FirebaseFirestore.instance
                    .collection('users')
                    .doc('mFvpSgSohmEM0AIrjjqQ')
                    .get()
                    .then((DocumentSnapshot documentSnapshot) {
                  if (documentSnapshot.exists) {
                    print(documentSnapshot.data()['word']);
                    setState(() {
                      wordList = documentSnapshot.data()['word'];
                    });
                  }
                });
              },
            child: Text("사전 가져오기",
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 5
              )
            ),
            child: ListView.builder(
                itemCount: wordList.length,
                itemBuilder: (BuildContext context, int index) => Text(wordList[index])
            ),
          )
        ],
      ),
    );
  }
}