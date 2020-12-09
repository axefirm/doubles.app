part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class CreateTask extends TaskEvent {
  String userId;
  String dueDate;
  String level;
  String title;
  String description;
  bool isDone;

  CreateTask(
      {this.userId,
      this.dueDate,
      this.level,
      this.title,
      this.description,
      this.isDone});
}