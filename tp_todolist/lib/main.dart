import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tp_todolist/widgets/task_creation_form.dart';
import 'package:tp_todolist/widgets/task_preview.dart';
import 'package:tp_todolist/widgets/task_details.dart';
import 'providers/task_provider.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
        path: '/taskdetails/:taskProviderindex',
        builder: (context, state) {
          final routeTaskProviderindex =
              (state.pathParameters['taskProviderindex']).toString();
          return TaskDetailsCard(
              taskProviderindex: int.parse(routeTaskProviderindex));
        }),
    GoRoute(
        path: '/taskcreation',
        builder: (context, state) {
          return TaskCreationPage();
        })
  ],
);

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => TaskProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // void _incrementCounter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text('TP To Do List'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, TaskProvider taskProvider, child) =>
            ListView.builder(
          itemCount: taskProvider.tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskPreviewCard(taskProviderindex: index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go('/taskcreation');
        },
        tooltip: 'New Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
