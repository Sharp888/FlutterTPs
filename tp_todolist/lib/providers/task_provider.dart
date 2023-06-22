import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  TaskProvider() {
    tasks = getTasks();
  }

  Task getTaskByID(String? taskID) {
    return tasks.firstWhere((task) => task.id == taskID);
  }

  static List<Task> getTasks() {
    List<Task> tasks = <Task>[];

    tasks.add(
      Task(
          content:
              "Le contenu de cette tache se trouve ici. \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
          id: '0',
          userId: '14',
          done: false,
          createdAt: DateTime(2023, 6, 14, 12, 0),
          updatedAt: DateTime(2023, 6, 15, 11, 01),
          deadline: DateTime(2023, 6, 16, 17, 00),
          category: 'Stars, Statements and Legends',
          priority: 1),
    );

    tasks.add(
      Task(
          content:
              "Task 1 - Le contenu de cette tache se trouve ici. \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
          id: '1',
          userId: '13',
          done: false,
          createdAt: DateTime(2023, 6, 14, 12, 0),
          updatedAt: DateTime(2023, 6, 15, 11, 01),
          deadline: DateTime(2023, 6, 16, 17, 00),
          category: 'Stars, Statements and Legends',
          priority: 1),
    );

    tasks.add(
      Task(
          content:
              "Task 2 - Le contenu de cette tache se trouve ici. \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
          id: '2',
          userId: '12',
          done: true,
          createdAt: DateTime(2023, 6, 14, 12, 0),
          updatedAt: DateTime(2023, 6, 15, 11, 01),
          deadline: DateTime(2023, 6, 16, 17, 00),
          category: 'Stars, Statements and Legends',
          priority: 1),
    );

    tasks.add(
      Task(
          content:
              "Task 3 - Le contenu de cette tache se trouve ici. \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
          id: '3',
          userId: '11',
          done: false,
          createdAt: DateTime(2023, 6, 14, 12, 0),
          updatedAt: DateTime(2023, 6, 15, 11, 01),
          deadline: DateTime(2023, 6, 16, 17, 00),
          category: 'Stars, Statements and Legends',
          priority: 1),
    );

    tasks.add(
      Task(
          content:
              "Task 4 - Le contenu de cette tache se trouve ici. \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
          id: '4',
          userId: '11',
          done: false,
          createdAt: DateTime(2023, 6, 14, 12, 0),
          updatedAt: DateTime(2023, 6, 15, 11, 01),
          deadline: DateTime(2023, 6, 16, 17, 00),
          category: 'Stars, Statements and Legends',
          priority: 1),
    );

    tasks.add(
      Task(
          content:
              "Task 5 - Le contenu de cette tache se trouve ici. \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
          id: '5',
          userId: '10',
          done: true,
          createdAt: DateTime(2023, 6, 14, 12, 0),
          updatedAt: DateTime(2023, 6, 15, 11, 01),
          deadline: DateTime(2023, 6, 16, 17, 00),
          category: 'Stars, Statements and Legends',
          priority: 1),
    );

    return tasks;
  }
}
