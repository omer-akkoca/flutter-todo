import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_model.dart';
import 'package:todoey/store/task_store.dart';

class TaskItem extends StatefulWidget {
  late TaskModel task;

  TaskItem({super.key, required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var store = context.watch<TaskStore>();
    return Container(
      color: widget.task.isDone ? Colors.black12 : Colors.white,
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.task.task,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                decoration: widget.task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: (){
              store.removeTheTask(widget.task);
            },
            child: const Icon(Icons.delete, color: Colors.red),
          ),
          const SizedBox(width: 5),
          Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: widget.task.isDone,
            onChanged: (e) {
              store.toggleTheTask(widget.task);
            }
          )
        ],
      ),
    );
  }
}


/*
class TaskItem extends StatelessWidget {

  late TaskModel task;

  TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          task.task,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            decoration: task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        Checkbox(
          value: task.isDone,
          onChanged: (e) {
            task.toggleDone();
          },
          activeColor: Colors.lightBlueAccent,
        )
      ],
    );
  }
}
*/