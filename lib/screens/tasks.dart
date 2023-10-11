import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_item.dart';
import 'package:todoey/screens/add_task.dart';
import 'package:todoey/models/task_model.dart';
import 'package:todoey/store/task_store.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskStore>(
      builder: (context, store, children) {
        return Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const AddTask(),
                  ),
                  backgroundColor: const Color(0x00000000),
                  isScrollControlled: true);
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.lightBlueAccent,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(Icons.list,
                            color: Colors.lightBlueAccent, size: 35),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Todoey",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${store.getTaskCount()} Tasks",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: store.getTaskCount(),
                    itemBuilder: (BuildContext context, int i) {
                      TaskModel task = store.getAllTasks()[i];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TaskItem(task: task),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
