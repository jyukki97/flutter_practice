import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: MediaQuery
              .of(context)
              .padding
              .top),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        cursorColor: Color(0xFF66bfbf),
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.undo, color: Color(0xFF66bfbf),), onPressed: null,),
                  IconButton(icon: Icon(Icons.redo, color: Color(0xFF66bfbf),), onPressed: null,),
                  IconButton(icon: Icon(Icons.check_rounded, color: Color(0xFF66bfbf),), onPressed: null,),
                ],
              ),
              Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                          height: 2
                      ),
                      maxLines: null,
                      cursorColor: Color(0xFF66bfbf),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'Contents',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                  )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xFF66bfbf),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(icon: Icon(Icons.list, color: Colors.white,), iconSize: 40, onPressed: null),
                      IconButton(icon: Icon(Icons.image_outlined, color: Colors.white,), iconSize: 40, onPressed: null),
                      IconButton(icon: Icon(Icons.camera_alt_rounded, color: Colors.white,), iconSize: 40, onPressed: null),
                      IconButton(icon: Icon(Icons.attach_file_rounded, color: Colors.white,), iconSize: 40, onPressed: null),
                      IconButton(icon: Icon(Icons.mic, color: Colors.white,), iconSize: 40, onPressed: null),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}