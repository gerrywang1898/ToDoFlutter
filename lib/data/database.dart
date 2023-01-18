import 'package:hive_flutter/hive_flutter.dart';

import '../util/todo_tile.dart';

class ToDoDataBase {
  List toDoList = [
    ['HW1', "somed", "In Progress"],
    ['HW2', "asdf", "Completed"],
  ];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }

  void editDatabase(int index) {
    _myBox.putAt(index, toDoList);
  }

}
