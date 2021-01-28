import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'bookstore/bookstore.dart';
import 'library/library.dart';

_HomeScreenState hsState = new _HomeScreenState();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => hsState;
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final queue = Queue<int>();

  final List<Widget> _children = [
    Library(),
    Bookstore(),
    Library(),
    Library(),
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
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Color(0xFFF3F3F3),
            appBar: AppBar(
                backgroundColor: Color(0xFFF3F3F3),
                shadowColor: Colors.transparent,
                toolbarHeight: 70,
                actions: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Icon(Icons.menu, color: Colors.black, size: 30,),
                  ),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0x6066bfbf)
                        ),
                        child: TextField(
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.search_rounded, color: Colors.white,
                              size: 30,),
                            contentPadding: EdgeInsets.only(left: 20, right: 10, top: 5),
                          ),
                        ),
                      )
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/book.svg",
                      color: Colors.black, height: 30, width: 30,),
                    onPressed: () {

                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15, bottom: 10, top: 10),
                    child: Stack(
                      children: [
                        IconButton(
                            icon: SvgPicture.asset(
                              "assets/icons/notification.svg",
                              color: Colors.black, height: 40, width: 40,),
                            onPressed: () {

                            },
                          ),
                        Positioned(
                            top: 5,
                            right: 10,
                            child: Container(
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                  color: Color(0xFF66bfbf),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                            )
                        )
                      ],
                    ),
                  )
                ]
            ),
            body: _children[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: Color(0xFF66bfbf),
              onTap: OnTap,
              currentIndex: currentIndex,
              items: [
                new BottomNavigationBarItem(
                  title: Text("library"),
                  icon: Icon(Icons.book),
                ),
                new BottomNavigationBarItem(
                  title: Text("bookstore"),
                  icon: Icon(Icons.local_grocery_store),
                ),
                new BottomNavigationBarItem(
                  title: Text("bag"),
                  icon: Icon(Icons.shopping_bag),
                ),
                new BottomNavigationBarItem(
                  title: Text("community"),
                  icon: SvgPicture.asset("assets/icons/chat.svg",
                    width: 20,
                    height: 20,
                    color: currentIndex == 3 ? Color(0xFF66bfbf) : Colors.grey,),
                ),
              ],
            )
        )
    );
  }
}