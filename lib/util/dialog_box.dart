import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'my_button.dart';

class DialogBox extends StatefulWidget {
  final titlecontroller;
  final descriptioncontroller;
  final statuscontroller;
  VoidCallback onSave;
  VoidCallback onCancel;


  DialogBox({
    super.key,
    required this.titlecontroller,
    required this.descriptioncontroller,
    required this.statuscontroller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  final items = [
    'Open',
    'In Progress',
    'Completed',

  ];

  String? value;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
    child: Text(
      item,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize:  20),
    )
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 800,
        width: 400,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            // get user input
            TextField(
              controller: widget.titlecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Task Title",
              ),
            ),
            TextField(
              controller: widget.descriptioncontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Task Description",
              ),
            ),
            DropdownButton<String>(
              value: value,
              items: items.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() => this.value = value,
            ),

        ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: widget.onSave),

                const SizedBox(width: 8),

                // cancel button
                MyButton(text: "Cancel", onPressed: widget.onCancel),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
