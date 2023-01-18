import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/database.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {

    // if (_myBox.get("TODOLIST") == null) {
    //   db.createInitialData();
    // } else {
    //   // there already exists data
    //   db.loadData();
    // }
    db.createInitialData();
    super.initState();
  }

  // text controller
  final _titlecontroller = TextEditingController();
  final _descriptioncontroller = TextEditingController();
  final _statuscontroller = TextEditingController();


  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_titlecontroller.text, _descriptioncontroller.text, _statuscontroller.text]);
      _titlecontroller.clear();
      _descriptioncontroller.clear();
      _statuscontroller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //view task
  viewTask(int index) {
    showDialog(
        context: context,
        builder:(context) {
          return DialogBox(
              titlecontroller: db.toDoList[index][0],
              descriptioncontroller: db.toDoList[index][1],
              statuscontroller: db.toDoList[index][2],
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop(),
          );
        },
    );
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          titlecontroller: _titlecontroller,
          descriptioncontroller: _descriptioncontroller,
          statuscontroller: _statuscontroller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Gerry Wang\'s Task List'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskDescription: db.toDoList[index][1],
            taskStatus: db.toDoList[index][2],
            //onPressed: viewTask(index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
