import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doubles/data/api/api.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if(event is CreateTask){
      try {
        yield TaskLoading();
        print("_mapCreateTask");
        print(event.title);

        QueryResult res = await Api.createTask(event);
        print("res:");
        print(res);
        if(res.data["createTask"]["success"]){
          yield TaskSuccess(res: res);
        }else{
          yield TaskFailed(res: res.data["createTask"]["message"]);
        }
      } catch (e) {
        print(e);
        yield TaskFailed(res: "Алдаа гарлаа системийн админд хандана уу");
      }
    }
    // TODO: implement mapEventToState
  }

}
