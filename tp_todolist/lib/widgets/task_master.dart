import 'package:flutter/material.dart';
import 'package:tp_todolist/widgets/task_preview.dart';

import '../models/task.dart';

class TasksMaster extends StatelessWidget {
  final List<Task> tasks;
  const TasksMaster({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskPreviewCard(task: tasks[index]);
        });
  }

  Color decideColor(int value) {
    if (value % 2 == 0) {
      return Color.fromARGB(255, 96, 181, 250);
    } else {
      return Color.fromARGB(255, 78, 97, 204);
    }
  }
}
