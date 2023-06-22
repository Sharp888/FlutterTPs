import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskDetailsCard extends StatelessWidget {
  final Task task;

  const TaskDetailsCard({
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
              Text(
                'Task ID: ${task.id} | User ID: ${task.userId}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                task.done == true ? 'Task Completed' : 'Task Incomplete',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: task.done == true ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Created: ${task.createdAt?.toString() ?? ''}',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Deadline: ${task.deadline?.toString() ?? ''}',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Last Updated: ${task.updatedAt?.toString() ?? ''}',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Content:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                task.content ?? '',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Category: ${task.category ?? ''}',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Priority: ${task.priority ?? ''}',
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
