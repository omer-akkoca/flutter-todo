class TaskModel{
  late String task;
  bool isDone;

  TaskModel({required this.task, this.isDone = false});

  void toggleDone(){
    isDone = !isDone;
  }
}