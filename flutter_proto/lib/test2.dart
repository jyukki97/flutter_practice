import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proto/test.dart';
import 'package:flutter_proto/test_list.dart';
import 'package:flutter_proto/togglebutton.dart';

class Testt extends StatefulWidget {
  @override
  _TesttState createState() => _TesttState();
}

class _TesttState extends State<Testt> {
  int _currentIndex = 5;
  List<bool> toggle = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 0,
            child: Column(
              children: [
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 3,
                    child: Image.asset(
                        "assets/images/top.jpg", fit: BoxFit.fill)
                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 30, bottom: 30, left: 70),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.66,
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_currentIndex == index) {
                                  _currentIndex = 5;
                                }
                                else {
                                  _currentIndex = index;
                                }
                              });
                            },
                            child: TestList(
                              title: "가가가가가가$index",
                              contents: '가가가가가가가ㅏ',
                              onClicked: _currentIndex == index ? true : false,
                            )
                        );
                      },

                    )
                ),
              ],
            )
        ),
        Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Color(0xFFe48c83),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Test()),
                );
              },
              child: Icon(Icons.add, color: Colors.white,),
            )
        ),
        Positioned(
            left: 10,
            top: MediaQuery
                .of(context)
                .size
                .height / 3 - 35,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  toggle[0] = !toggle[0];
                });
              },
                child: ToggleButton(position: 10, isCliced: toggle[0],),
            )
        ),
        Positioned(
            left: 100,
            top: MediaQuery
                .of(context)
                .size
                .height / 3 - 35,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  toggle[1] = !toggle[1];
                  print(toggle[1]);
                });
              },
              child: ToggleButton(position: 100, isCliced: toggle[1],),
            )
        ),
        Positioned(
            left: 190,
            top: MediaQuery
                .of(context)
                .size
                .height / 3 - 35,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  toggle[2] = !toggle[2];
                });
              },
              child: ToggleButton(position: 190, isCliced: toggle[2],),
            )
        ),
      ],
    );
  }
}