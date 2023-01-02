import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../model/todo.dart';

class ToDoItem extends StatefulWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  _ToDoItemState createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool _isExpanded =
      false; // define and initialize the expansion state variable
  bool _isEditing = false;
  final _titleController = TextEditingController();

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded; // toggle the expansion state
    });
  }

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.todo.title!;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: _toggleExpansion,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              widget.todo.isDone
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: tdBlue,
            ),
            onPressed: () {
              setState(() {
                widget.todo.isDone = !widget.todo.isDone;
              });
            },
          ),
          title: _isEditing
              ? Form(
                  child: TextFormField(
                    initialValue: widget.todo.title,
                    //controller: _titleController,
                    onChanged: (value) {
                      setState(() {
                        widget.todo.title = value;
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          setState(() {
                            _isEditing = false;
                          });
                        },
                      ),
                    ),
                  ),
                )
              : Text(
                  widget.todo.title?.toString() ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: tdBlack,
                    decoration:
                        widget.todo.isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
          subtitle: _isExpanded
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.todo.todoText!,
                    style: TextStyle(
                      fontSize: 16,
                      color: tdBlack,
                      decoration: widget.todo.isDone
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                )
              : null,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 3),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.red,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  color: Colors.white,
                  iconSize: 18,
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // print('Clicked on delete icon');
                    widget.onDeleteItem(widget.todo.id);
                  },
                ),
              ),
              if (_isExpanded)
                Container(
                  padding: const EdgeInsets.all(0),
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 3),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    iconSize: 18,
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // print('Clicked on edit icon');
                      setState(() {
                        _isEditing = !_isEditing;
                        if (!_isEditing) {
                          // Update the todo title with the value in the TextFormField
                          widget.todo.title = _titleController.text;
                          // _titleController.clear();
                          // Call the onToDoChanged callback to update the todo item in the list
                          widget.onToDoChanged(widget.todo);
                        }
                      });
                    },
                  ),
                ),
            ],
          ),
        ));
  }
}
