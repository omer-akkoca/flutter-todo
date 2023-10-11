
import 'package:flutter/material.dart';
import 'package:todoey/constants/screens.dart';
import 'package:todoey/screens/tasks.dart';
import 'package:provider/provider.dart';
import 'package:todoey/store/task_store.dart';

void main() => runApp(Todeey());

class Todeey extends StatelessWidget {
  Todeey({super.key});
  TaskStore taskStore = TaskStore();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskStore>(
      create: (context) => taskStore,
      child: MaterialApp(
        initialRoute: Screens.tasks,
        routes: {
          Screens.tasks: (context) => const Tasks(),
        },
      ),
    );
  }
}
