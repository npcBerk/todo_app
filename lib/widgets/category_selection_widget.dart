import 'package:flutter/material.dart';
import 'package:todo_app/constants/task_type.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key, required this.type, required this.onSelected});
  final TaskType type;
  final VoidCallback onSelected;

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  TaskType taskType = TaskType.notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: 300),
            content: Text("Category Selected"),
          ),
        );
        widget.onSelected();
      },
      child: Image.asset("lib/assets/images/category_${widget.type.name.toString()}.png"),
    );
  }
}
