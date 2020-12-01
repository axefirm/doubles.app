part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {

  var res;

  LoginSuccess({this.res});
}

class LoginFailed extends LoginState {

  var res;

  LoginFailed({this.res});
}

