class Todo {
  String? id;
  String todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return[
      Todo(id: "01", todoText: "checks mails",isDone: true),

      Todo(id: "02", todoText: "Development ",isDone: true),

      Todo(id: "03", todoText: "gym",isDone: false),

      Todo(id: "04", todoText: "form filling",isDone: false),

      Todo(id: "05", todoText: "aptitute prepration",isDone: false),

      Todo(id: "06", todoText: "early moring wake up",isDone: false),

      Todo(id: "07", todoText: "to bed at 10pm",isDone: false),

      Todo(id: "08", todoText: " placement talks ",isDone: false),

    ];
  }
}
