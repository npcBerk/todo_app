import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/task_type.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/widgets/todo.dart';

//List<String> todo = ["Study Lessons", "Run 5K", "Go to party"];
//List<String> completed = ["Game meetup", "Take out trash"];

List<Task> todo = [
  Task(
    type: TaskType.notes,
    title: "Study Lessons",
    description: "Study CS150",
    isCompleted: false,
  ),
  Task(
    type: TaskType.calendar,
    title: "Go to party",
    description: "Attend to party",
    isCompleted: false,
  ),
  Task(
    type: TaskType.contest,
    title: "Run 5K",
    description: "Run 5 kilometers",
    isCompleted: false,
  ),
];

List<Task> completed = [
  Task(
    type: TaskType.calendar,
    title: "Game meetup",
    description: "Attend to party",
    isCompleted: false,
  ),
  Task(
    type: TaskType.contest,
    title: "Take out trash",
    description: "Run 5 kilometers",
    isCompleted: false,
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    DateTime now = DateTime.now();
    String date = "${now.day}/${now.month}/${now.year}";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              Container(
                height: deviceHeight / 6 + 122,
                width: deviceWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/header_home-page.png"),
                    fit:
                        BoxFit.cover, //aspect ratio bozmadan oturmasını sağlar.
                  ),
                  color: Colors.indigoAccent,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        date,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "My Todo List",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return TodoItem(task: todo[index]);
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Completed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: completed.length,
                      itemBuilder: (context, index) {
                        return TodoItem(task: completed[index]);
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddNewTaskScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor(headerColor),
                ),
                child: Text(
                  "Add New Task",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
