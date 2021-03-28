import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_todolist_web/components/side_menu.dart';
import 'package:flutter_sample_todolist_web/models/Todo.dart';
import 'package:flutter_sample_todolist_web/views/todo/components/list_of_todo.dart';
import 'package:flutter_sample_todolist_web/views/todo/components/list_of_todo_item.dart';
import 'package:flutter_sample_todolist_web/views/todo/components/page_of_todo.dart';

import '../../constants.dart';
import '../../responsive.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({
    Key key,
  }) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();

}
class _TodoScreenState extends State<TodoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selected = 3;
  Todo selectedTodo;

  onClickTodo(ListOfTodoItem todoWidget){
    setState(() {
      selected = todoWidget.todo.state;
      selectedTodo = todoWidget.todo;
    });
  }

  onClickBackButton() {
    setState(() {
      selected = 3;
      selectedTodo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        drawer: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 250),
          child: SideMenu(),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Row(
                children: [
                  if (!Responsive.isDesktop(context))
                    IconButton(
                      icon: Icon(Icons.menu,),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.search_rounded, size: 30,),
                      onPressed: () {

                      }
                  ),
                  SizedBox(width: kDefaultPadding,),
                  CircleAvatar(
                    child: SizedBox(),
                  )
                ],
              ),
            ),
            if(Responsive.isMobile(context))
              Expanded(
                  child: ListOfTodo(title: 'TODO', todo: todo_data,)
              )
            else
              Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(selected == 3 || selected == 0)
                        Expanded(
                            flex: 1,
                            child: ListOfTodo(title: 'TODO', todo: todo_data,  selectFuc: onClickTodo, key: UniqueKey())
                        ),
                      if(selected == 3 || selected == 1)
                        Expanded(
                            flex: 1,
                            child: ListOfTodo(title: '진행중', todo: ing_data,  selectFuc: onClickTodo, key: UniqueKey())
                        ),
                      if(selected == 3 || selected == 2)
                        Expanded(
                            flex: 1,
                            child: ListOfTodo(title: '완료', todo: done_data, selectFuc: onClickTodo, key: UniqueKey(),)
                        ),
                      if(selected != 3)
                        Expanded(
                          flex: 2,
                          child: PageOfTodo(todo: selectedTodo, onClickBackButton: onClickBackButton,)
                        )
                    ],
                  )
              )
          ],
        )
    );
  }
}