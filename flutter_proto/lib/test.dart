import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                  "assets/images/background.png", fit: BoxFit.fill),
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.9,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.only(top: 90, left: 40, right: 40),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/board.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.apps, color: Color(0xFFe48c83), size: 30),
                      SizedBox(width: 10,),
                      Text(
                        "Task",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFe48c83),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color(0x30edb9b5),
                    ),
                    child: TextField(
                      maxLength: 10,
                      cursorColor: Color(0xFFe9a49e),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFe9a49e),
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: ''
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.create, color: Color(0xFFe48c83), size: 30),
                      SizedBox(width: 10,),
                      Text(
                        "Notes",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFe48c83),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color(0x30edb9b5),
                    ),
                    child: TextField(
                      maxLines: 6,
                      maxLength: 100,
                      cursorColor: Color(0xFFe9a49e),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFe9a49e),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 10,
                child: FloatingActionButton(
                  onPressed: () {

                  },
                  child: Icon(Icons.check_rounded, color: Colors.white,),
                  backgroundColor: Color(0xFFe48c83),
                )
            )
          ]
      ),
    );
  }
}