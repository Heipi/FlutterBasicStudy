//@dart=2.9
import 'package:flutter/material.dart';
import 'package:light/todoey/screens/task_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: TaskScreen(),
    );
  }
}
