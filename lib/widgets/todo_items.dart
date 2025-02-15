import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/contant/Appstyle.dart';
import 'package:to_do_list/models/Todo.dart';

class TodoItems extends StatelessWidget {
  final Todo todo;
  final onTodoChange;
  final tododelete;

  const TodoItems({super.key,required this.todo,required this.onTodoChange,required this.tododelete});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
         onTodoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box:Icons.check_box_outline_blank,
          color: AppStyle.tdBLUE,
        ),
        title: Text(todo.todoText,
          style:
              TextStyle(fontSize: 20, decoration: todo.isDone ? TextDecoration.lineThrough:null),
        ),
        trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
            onPressed: () {
              tododelete(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
