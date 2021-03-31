import 'package:flutter/material.dart';
import 'package:light/todoey/model/task.dart';
import 'package:light/todoey/model/task_data.dart';
import 'package:light/todoey/widgets/task_title.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTitle(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkboxCallback: (bool? checkboxState) {
                taskData.updateTask(taskData.tasks[index]);
                // setState(() {
                //   widget.tasks[index].toggleDone();
                //   // isChecked = checkboxState != null ? checkboxState : false;
                // });
              },
              onLongPressCallback: () {
                taskData.deleteTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

/*class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTitle(
            isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
            taskTitle: Provider.of<TaskData>(context).tasks[index].name,
            checkboxCallback: (bool? checkboxState) {
              // setState(() {
              //   widget.tasks[index].toggleDone();
              //   // isChecked = checkboxState != null ? checkboxState : false;
              // });
            });
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}*/

/*class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList(this.tasks);

  @override
  TaskListState createState() {
    return TaskListState();
  }
}

class TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(name: "Buy milk"),
    Task(name: "Buy eggs"),
    Task(name: "Buy bread"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTitle(
            isChecked: widget.tasks[index].isDone,
            taskTitle: widget.tasks[index].name,
            checkboxCallback: (bool? checkboxState) {
              setState(() {
                widget.tasks[index].toggleDone();
                // isChecked = checkboxState != null ? checkboxState : false;
              });
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}*/

/*
     ListTile(
          title: Text('This is a task'),
          trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            onChanged: (bool) {},
            value: false,
          ),
        ),
* */
