import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/task.dart';

class TaskCreationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Task _newTask = Task();

  TaskCreationPage({super.key});

  // final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextEditingController contentController = TextEditingController();
    final ValueNotifier<bool> doneController = ValueNotifier<bool>(false);
    DateTime? deadlineController;
    // final TextEditingController categoryController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text('TP To Do List'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //FORM FIELDS ________________________________________

              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                onSaved: (value) => _newTask.content = value,
              ),

              Switch(
                  value: doneController.value,
                  onChanged: (newValue) {
                    doneController.value = newValue;
                  }),

              // const SizedBox(height: 16),
              // const Text('Deadline:'),
              InputDatePickerFormField(
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                onDateSaved: (date) {
                  deadlineController = date;
                },
              ),

              const SizedBox(height: 16),

              //FORM FIELDS _________________________________

              // TODO: ajouter plus de champs pour les autres attributs de Task

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        createNewTask();
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

  void createNewTask() {
    //TODO
  }
}
