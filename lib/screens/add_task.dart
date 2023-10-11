import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/store/task_store.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController inputController = TextEditingController();
  String text = "";

  @override
  Widget build(BuildContext context) {
    var store = context.watch<TaskStore>();
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 50, left: 15, right: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 25),
          const Text(
            "Add a Task",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 25),
          TextField(
            controller: inputController,
            onChanged: (e){
              text = e.toString();
            },
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "Type a task...",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlueAccent,
                  width: 2,
                ),
              ),
              prefixIconColor: Colors.lightBlueAccent,
              contentPadding: EdgeInsets.all(0),
            ),
          ),
          const SizedBox(height: 25),
          FilledButton(
            onPressed: () {
              store.addATask(text);
              inputController.text = "";
            },
            style: const ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll<Color>(Colors.lightBlueAccent),
            ),
            child: const Text(
              "Add",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}