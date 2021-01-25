import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Test.dart';
import 'note_add.dart';
import 'notes.dart';

_HomeScreenState hsState = new _HomeScreenState();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => hsState;
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int tabIndex = 0;

  final queue = Queue<int>();

  final List<Widget> _children = [
    Notes(),
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
          if (queue.isEmpty) {
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
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Color(0xFFF3F3F3),
            appBar: AppBar(
              backgroundColor: Color(0xFFF3F3F3),
              shadowColor: Colors.transparent,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TabBar(
                    onTap: (int index){
                      setState(() {
                        tabIndex = index;
                      });
                    },
                    labelPadding: EdgeInsets.only(left: 5, right: 5),
                    unselectedLabelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    labelColor: Color(0xFF66bfbf),
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: Align(
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Notes'),
                              tabIndex == 0 ? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_down, color: Colors.transparent,)
                            ],
                          )
                        ),
                      ),
                      Tab(
                        child: Align(
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Tasks'),
                                tabIndex == 1 ? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_down, color: Colors.transparent,)
                              ],
                            )
                        ),
                      ),
                    ],
                  )
                ],
              ),
              actions: [
                IconButton(icon: Icon(Icons.settings, color: Color(0xFF66bfbf),), onPressed: null)
              ],
            ),
            body: TabBarView(
              children: [
                Notes(),
                Test()
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoteAdd()),
                );
              },
              backgroundColor: Color(0xFF66bfbf),
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          ),
        )
    );
  }
}