import 'package:flutter/material.dart';
import 'package:light/todoey/widgets/task_title.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TaskTitle(),
        ListTile(
          title: Text('This is a task'),
          trailing: Checkbox(
            value: false,
          ),
        ),
      ],
    );
  }
}
