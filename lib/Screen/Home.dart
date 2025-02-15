import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/contant/Appstyle.dart';
import 'package:to_do_list/models/Todo.dart';
import 'package:to_do_list/widgets/todo_items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todolist = Todo.todoList();
  List<Todo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.tdBGcolor,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                buildserchbar(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 30),
                        child: Text(
                          "All ToDos",
                          style: TextStyle(
                              color: AppStyle.tdblack,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (Todo todo0 in _foundToDo.reversed)
                        TodoItems(
                          todo: todo0,
                          onTodoChange: _handleTodoChanges,
                          tododelete: _deletetodoitem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5, right: 10, left: 20),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 10,
                              blurStyle: BlurStyle.normal,
                              blurRadius: 10.0)
                        ]),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add new todo item ",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5, right: 10, left: 0),
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      _addtodoitem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      elevation: 10,
                    ),
                    child: const Text(
                      "+",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void runFliter(String enterkeyword) {
    List<Todo> result = [];
    if (enterkeyword.isEmpty) {
      result = todolist;
    } else {
      result = todolist
          .where((item) =>
              item.todoText!.toLowerCase().contains(enterkeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = result;
    });
  }

  void _handleTodoChanges(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deletetodoitem(String id) {
    setState(() {
      todolist.removeWhere((item) => item.id == id);
    });
  }

  void _addtodoitem(String todo) {
    setState(() {
      todolist.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo));
    });
    _todoController.clear();
  }

  Widget buildserchbar() {
    return Container(
      height: 50,
      width: 500,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => runFliter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(Icons.search),
            prefixIconConstraints: BoxConstraints(
              minHeight: 20,
              maxHeight: 40,
            ),
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(color: AppStyle.tdgrey)),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/profile.jpg')),
          ),
        ],
      ),
      backgroundColor: AppStyle.tdBGcolor,
    );
  }
}
