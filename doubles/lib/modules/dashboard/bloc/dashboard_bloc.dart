import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doubles/data/api/api.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if(event is GetTasks){
      try {
        yield DashboardLoading();

        QueryResult res = await Api.getTasks();
        yield DashboardSuccess(res: res);
      } catch (e) {
        yield DashboardFailed(res: "failed");
      }
    }
  }
}
