import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light/todoey/model/task.dart';
import 'package:light/todoey/model/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  String? newTaskTitle;
  // final Function addTaskCallback;
  // AddTaskScreen({Key? key, required this.addTaskCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            TextButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.lightBlueAccent)),
              // style: ,
              // color: Colors.lightBlueAccent,
              onPressed: () {
                if (newTaskTitle == null || newTaskTitle!.isEmpty) return;
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle!);
                Navigator.of(context).pop();
                // addTaskCallback(newTaskTitle);
              },
            ),
          ],
        ),
      ),
    );
  }
}
