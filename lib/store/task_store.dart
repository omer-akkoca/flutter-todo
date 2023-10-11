import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:todoey/models/task_model.dart';

class TaskStore extends ChangeNotifier{
  final String name = "Ömer Akkoca";
  late List<TaskModel> _allTasks;

  TaskStore(){
    _allTasks = [];
  }

  void addATask(String title){
    _allTasks.add(TaskModel(task: title));
    notifyListeners();
  }

  UnmodifiableListView<TaskModel> getAllTasks() => UnmodifiableListView(_allTasks);

  int getTaskCount() => _allTasks.length;

  void toggleTheTask(TaskModel task){
    task.toggleDone();
    notifyListeners();
  }

  void removeTheTask(TaskModel task){
    _allTasks.remove(task);
    notifyListeners();
  }

}