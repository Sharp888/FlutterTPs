import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/task.dart';

class TaskPreviewCard extends StatelessWidget {
  final Task task;

  const TaskPreviewCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        color: Colors.lightBlue.shade50,
      ),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.done == true ? 'Done' : 'Not Done',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: task.done == true ? Colors.green : Colors.red,
                    ),
                  ),
                  Text(
                    task.deadline != null ? task.deadline.toString() : '',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                task.content != null && task.content!.length > 100
                    ? '${task.content!.substring(0, 100)}...'
                    : '',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String? taskId = task.id;
                  GoRouter.of(context).go('/taskdetails/$taskId');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text('Plus d\'infos...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
