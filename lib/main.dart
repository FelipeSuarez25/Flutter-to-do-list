import 'package:flutter/material.dart';
import 'package:flutter_visual_code/factory/task_factory.dart';
import 'package:flutter_visual_code/models/task.dart';
import 'package:flutter_visual_code/views/detail_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.limeAccent[800],
        fontFamily: 'Georgia',
      ),
        home: ToDoList());
  }
}

class ToDoList extends StatelessWidget {

  ToDoList({key}) : super(key: key);
 
  //tasks.map((e) => Container(child: Text("Hola"))).toList()

  List<Task> tasks = TaskFactory().generateTask();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.check),
             tooltip: 'Lista de tareas',
             onPressed: null,
          ),
          title: const Text("Lista de tareas"),
        ),
        body: Container(
          
          padding: const EdgeInsets.all(20),
          child: Column(
            children: 
              tasks.map((task) => Container(
                height: 50,
                padding: const EdgeInsets.only(left: 20, right: 20),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.lightBlue.shade100),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailTask()) 
                        );
                      }, 
                      icon: const Icon(Icons.arrow_circle_right_outlined)
                      ),
                    Text(task.name()),
                    task.status() ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank_outlined),
                  ],
                ),
              )).toList()
          ),
        )
      );
  }
}