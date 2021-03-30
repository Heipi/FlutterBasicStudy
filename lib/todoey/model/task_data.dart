import 'package:flutter/material.dart';
import 'package:light/todoey/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "Buy milk"),
    Task(name: "Buy eggs"),
    Task(name: "Buy bread"),
  ];
  int get taskCount {
    return tasks.length;
  }
}
