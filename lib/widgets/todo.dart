import 'package:flutter/material.dart';
import 'package:todo_app/constants/task_type.dart';
import 'package:todo_app/models/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget.task.type == TaskType.notes
                ? Image.asset("lib/assets/images/category_study.png")
                : widget.task.type == TaskType.calendar
                ? Image.asset("lib/assets/images/category_activity.png")
                : Image.asset("lib/assets/images/category_sport.png"),
            //const Icon(Icons.library_books_outlined, size: 50),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration:
                          widget.task.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                    ),
                  ),
                  Text(
                    widget.task.description,
                    style: TextStyle(decoration: widget.task.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: widget.task.isCompleted,
              onChanged:
                  (val) => {
                    setState(() {
                      widget.task.isCompleted = !widget.task.isCompleted;
                    }),
                  },
              splashRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
