import 'package:flutter/material.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key, required this.title});
  final String title;

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 300),
                        content: Text("Category Selected"))
                    );
                  },
                  child: Image.asset("lib/assets/images/category_${widget.title}.png"),);
  }
}