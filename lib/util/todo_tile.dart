import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatefulWidget {

  final String taskName;
  final String taskDescription;
  final String taskStatus;
  //void Function()? onPressed;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskDescription,
    required this.taskStatus,
    //required this.onPressed,
    required this.deleteFunction,
  });

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // task name
              Text(
                widget.taskName,
              ),
              TextButton(
                  onPressed: null, //widget.onPressed,
                  child: Text("View Task"),
              )
              // Text(
              //   widget.taskDescription,
              // ),
              // Text(
              //   widget.taskStatus,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
