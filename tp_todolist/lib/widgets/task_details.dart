import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskDetailsCard extends StatelessWidget {
  final int taskProviderindex;

  const TaskDetailsCard({
    super.key,
    required this.taskProviderindex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text('TP To Do List'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, TaskProvider taskProvider, child) => Container(
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
                    'Task ID: ${taskProvider.tasks[taskProviderindex].id} | User ID: ${taskProvider.tasks[taskProviderindex].userId}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    taskProvider.tasks[taskProviderindex].done == true
                        ? 'Task Completed'
                        : 'Task Incomplete',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: taskProvider.tasks[taskProviderindex].done == true
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Created: ${taskProvider.tasks[taskProviderindex].createdAt?.toString() ?? ''}',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Deadline: ${taskProvider.tasks[taskProviderindex].deadline?.toString() ?? ''}',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Last Updated: ${taskProvider.tasks[taskProviderindex].updatedAt?.toString() ?? ''}',
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
                    taskProvider.tasks[taskProviderindex].content ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Category: ${taskProvider.tasks[taskProviderindex].category ?? ''}',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Priority: ${taskProvider.tasks[taskProviderindex].priority ?? ''}',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).go('/');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          textStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                        ),
                        child: const Text('Retour à la Liste'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          taskProvider
                              .changeStatusOfTaskByIndex(taskProviderindex);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          textStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                        ),
                        child: const Text('Task Status'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
