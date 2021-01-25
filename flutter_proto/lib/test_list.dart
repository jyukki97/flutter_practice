import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestList extends StatelessWidget{
  String title;
  String contents;
  bool onClicked;

  TestList({this.title, this.contents, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFe9a49e),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/icons/seed.png", scale: 15, color: Colors.white,),
              ),
              SizedBox(height: 10,),
              Container(
                  width: 1.5,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFe9a49e),
                  ),
                ),
              SizedBox(height: 10,)
            ],
          ),
          SizedBox(width: 20,),
          Expanded(
              child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFe9a49e)
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        contents,
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      onClicked
                          ? Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 30),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFe9a49e),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("tap");
                                },
                                child: Icon(Icons.ac_unit_outlined, size: 30,
                                  color: Colors.white,),
                              ),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: () {
                                  print("tap");
                                },
                                child: Icon(Icons.check_rounded, size: 30,
                                  color: Colors.white,),
                              ),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: () {
                                  print("tap");
                                },
                                child: Icon(Icons.delete, size: 30,
                                  color: Colors.white,),
                              ),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: () {
                                  print("tap");
                                },
                                child: Icon(Icons.create, size: 30,
                                  color: Colors.white,),
                              )
                            ],
                          )
                      ) : Text('')
                    ],
                  )
              )
          )
        ],
      ),
    );
  }
}