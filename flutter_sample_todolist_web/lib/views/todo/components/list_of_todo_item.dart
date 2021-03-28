import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_todolist_web/models/Todo.dart';

import '../../../constants.dart';

class ListOfTodoItem extends StatefulWidget {
  const ListOfTodoItem({
    Key key,
    this.todo,
    this.selectFuc
  }) : super(key: key);

  final Todo todo;
  final Function selectFuc;


  @override
  _ListOfTodoItemState createState() => _ListOfTodoItemState();
}

class _ListOfTodoItemState extends State<ListOfTodoItem> {
  Color boxColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.selectFuc(widget);
        });
      },
      child: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: boxColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                widget.todo.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

}