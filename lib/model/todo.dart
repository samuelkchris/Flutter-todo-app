class ToDo {
  String? id;
  String? todoText;
  String? title;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    required this.title,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [];
  }
}
