import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_todolist_web/constants.dart';
import 'package:flutter_sample_todolist_web/models/Todo.dart';

class PageOfTodo extends StatelessWidget {
  final Todo todo;
  final Function onClickBackButton;
  PageOfTodo({
    this.todo,
    this.onClickBackButton
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: (){
                          onClickBackButton();
                        }
                        )
                  ],
                ),
              ),
              Container(
                child: Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Divider(thickness: 1,),
              Container(
                child:Text(
                  todo.body,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),
                child: Column(
                    children: [
                      Text('댓글'),

                    ]
                ),
              ),
            ]
          ),
        ),
    );
  }


}