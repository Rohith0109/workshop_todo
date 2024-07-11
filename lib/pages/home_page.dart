import 'dart:collection';

import 'package:flutter/material.dart';
import '../custom_widgets/custom_todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List tasks = [
    ["Buy milk", true],   
    ["Buy eggs", false],
    ["Buy bread", true],
    ["Buy chicken", false],
  ];
  final TextEditingController _controller = TextEditingController();

  bool check = false;

  void checkBoxClick(bool? value, int index){
    setState(() {
      tasks[index][1] = value!;
    });
  }

  void _addTask(){
    showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: Text("Add task"),
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter new task",
                border: OutlineInputBorder(
          
                )
              )
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                  _controller.clear();
                  Navigator.of(context).pop();
                }, child: Text("Cancel")),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    tasks.add([_controller.text, false]);
                  });
                  print(tasks);
                  _controller.clear();
                  Navigator.of(context).pop();
                }, child: Text("Add")),
              ],
            ),
          )
        ],
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
      ),
      body: Center(child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: ((context, index) {
        return CustomTodoTile(title: tasks[index][0], value: tasks[index][1], onChanged: (value) => checkBoxClick(value, index));
      }))),
      floatingActionButton: FloatingActionButton(onPressed: _addTask, child: const Icon(Icons.add),)
    );
  }
}