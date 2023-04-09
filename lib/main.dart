import 'package:flutter/material.dart';
import 'package:flutter_visual_code/factory/task_factory.dart';
import 'package:flutter_visual_code/models/task.dart';

void main() {
  runApp(MaterialAppCustom());
}

class MaterialAppCustom extends StatelessWidget {
   const MaterialAppCustom();

   @override
   Widget build(BuildContext context){
    return MaterialApp(
      home: ToDoList(),
    );
   }
}

///separar ingreso de creación de
///oauth2 para inicio de sección con googlw
///

class ToDoList extends StatelessWidget {

  ToDoList({super.key});

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
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      iconSize: 40,
                      color: Colors.blueGrey,
                      onPressed: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(builder: (context) =>  SegundaPantalla(task)),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_circle_right_outlined,
                      ),
                    )

                    ,
                    Text(task.name()),
                    task.status() ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank_outlined),
                  ],

                ),
              )).toList()

          ),

        ),

      );
  }
}

class SegundaPantalla extends StatelessWidget {
   SegundaPantalla(this.t);

 Task t;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(t.name()),
      ),
      body: Center(
        child: SelectionArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              Text(t.name()),
              Text(t.endDate()),
              t.status() ? Text("True") : Text("False"),
          //    Text(t.status() as String),

            ],
          ),
        ),
      ),
    );
  }
}