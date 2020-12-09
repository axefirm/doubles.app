part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskSuccess extends TaskState {

  var res;

  TaskSuccess({this.res});
}

class TaskFailed extends TaskState {

  var res;

  TaskFailed({this.res});
}