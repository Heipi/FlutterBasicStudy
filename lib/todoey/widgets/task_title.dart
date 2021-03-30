import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  Function(bool? checkboxState)? checkboxCallback;
  TaskTitle(
      {required this.isChecked,
      required this.taskTitle,
      this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        // onChanged: toggleCheckboxState,
        value: isChecked, onChanged: checkboxCallback,
      ),
    );
  }

  /*void checkboxCallback(bool? checkboxState) {
    setState(() {
      isChecked = checkboxState != null ? checkboxState : false;
    });
  }*/

/*  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
        checkboxState: isChecked,
        toggleCheckboxState: checkboxCallback,
      ),
    );
  }*/
}

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final ValueChanged<bool?> toggleCheckboxState;

  TaskCheckbox(
      {Key? key,
      required this.checkboxState,
      required this.toggleCheckboxState})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      onChanged: toggleCheckboxState,
      value: checkboxState,
    );
  }
}
