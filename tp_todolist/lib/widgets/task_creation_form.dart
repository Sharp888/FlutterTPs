import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/task.dart';

class TaskCreationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Task _newTask = Task();

  TaskCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text('TP To Do List'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0), // Add desired margin
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Content'),
                onSaved: (value) => _newTask.content = value,
              ),
              // TODO: ajouter plus de champs pour les autres attributs de Task
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        createNewTask(_newTask);
                      }
                    },
                    child: const Text('Create Task'),
                  ),
                  const SizedBox(width: 8),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createNewTask(Task task) {
    //TODO
  }
}
