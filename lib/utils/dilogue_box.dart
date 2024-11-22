import 'package:flutter/material.dart';
import 'package:todoapp/utils/my_button.dart';

class DilogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DilogueBox({super.key, this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Add a new Task"),
            ),
            //save button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onpressed: onSave,),
                const SizedBox(width: 8,),
                //cancel button
                MyButton(text: "Cancel", onpressed: onCancel,),
            ]
            )
          ],
        ),
      ),
    );
  }
}

