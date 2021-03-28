import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_todolist_web/components/side_menu.dart';
import 'package:flutter_sample_todolist_web/responsive.dart';
import 'package:flutter_sample_todolist_web/views/todo/components/list_of_todo.dart';
import 'package:flutter_sample_todolist_web/views/todo/todo_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
          desktop: Container(
              child: Row(
                children: [
                  SideMenu(),
                  Expanded(
                      child: TodoScreen()
                  )
                ],
              )
          ),
          tablet: TodoScreen(),
          mobile: TodoScreen()
      ),
    );
  }
}