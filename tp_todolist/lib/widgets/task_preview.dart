import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TaskPreviewCard extends StatelessWidget {
  final int taskProviderindex;

  const TaskPreviewCard({super.key, required this.taskProviderindex});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      taskProvider.tasks[taskProviderindex].done == true
                          ? 'Done'
                          : 'Not Done',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:
                            taskProvider.tasks[taskProviderindex].done == true
                                ? Colors.green
                                : Colors.red,
                      ),
                    ),
                    Text(
                      taskProvider.tasks[taskProviderindex].deadline != null
                          ? taskProvider.tasks[taskProviderindex].deadline
                              .toString()
                          : '',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  taskProvider.tasks[taskProviderindex].content != null &&
                          taskProvider
                                  .tasks[taskProviderindex].content!.length >
                              100
                      ? '${taskProvider.tasks[taskProviderindex].content!.substring(0, 100)}...'
                      : '',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .go('/taskdetails/$taskProviderindex');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      child: const Text('Plus d\'infos...'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        taskProvider.deleteTaskByIndex(taskProviderindex);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      child: const Text('Supprimer la tâche'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
