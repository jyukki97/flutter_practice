import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_todolist_web/models/Todo.dart';
import '../../../constants.dart';
import 'list_of_todo_item.dart';

class ListOfTodo extends StatefulWidget {
  const ListOfTodo({
    Key key,
    this.title,
    this.todo,
    this.selectFuc
  }) : super(key: key);

  final String title;
  final List<Todo> todo;
  final Function selectFuc;

  @override
  _ListOfTodoState createState() => _ListOfTodoState();
}

class _ListOfTodoState extends State<ListOfTodo> {
  bool isFolded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 5),
        height: isFolded ? 150 : double.infinity,
        padding: EdgeInsets.all(kDefaultPadding),
        margin: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.title,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: kDefaultPadding,),
                Text(widget.todo.length.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey
                  ),
                ),
                Spacer(),
                IconButton(
                    icon: Icon(isFolded ? Icons.arrow_drop_down : Icons.arrow_drop_up),
                    onPressed: (){
                      setState(() {
                        isFolded = !isFolded;
                      });
                    }
                    )
              ],
            ),
            Divider(thickness: 1,),
            SizedBox(height: kDefaultPadding,),
            if(!isFolded)
              Expanded(
                child: ListView.builder(
                    itemCount: widget.todo.length,
                    itemBuilder: (context, index) {
                      return ListOfTodoItem(todo: widget.todo[index], selectFuc: widget.selectFuc,);
                    }
                )
            )
          ],
        )
    );
  }
}