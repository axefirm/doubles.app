part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  QueryResult res;

  DashboardSuccess({this.res});
}

class DashboardFailed extends DashboardState {
  var res;



  DashboardFailed({this.res});
}

