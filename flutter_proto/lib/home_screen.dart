import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proto/test.dart';
import 'package:flutter_proto/test2.dart';

_HomeScreenState hsState = new _HomeScreenState();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => hsState;
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final queue = Queue<int>();

  final List<Widget> _children = [
    Testt(),
  ];

  void OnTap(int index) {
    setState(() {
      if(index != currentIndex) queue.add(currentIndex);
      currentIndex = index;
    });
  }

  Future<bool> onbackpress() async{
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if(queue.isEmpty) {
            return showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(title: Text("Terminate?"),
                    actions: <Widget>[
                      FlatButton(child: Text("Yes"),
                        onPressed: () => Navigator.pop(context, true),),
                      FlatButton(child: Text("No"),
                        onPressed: () => Navigator.pop(context, false),),
                    ],
                  ),
            );
          }
          else {
            setState(() {
              currentIndex = queue.removeLast();
              print("backpress");
            });
            return onbackpress();
          }
        },
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: _children[currentIndex],
        )
    );
  }
}