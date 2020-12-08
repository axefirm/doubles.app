part of 'signup_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {

  var res;

  SignUpSuccess({this.res});
}

class SignUpFailed extends SignUpState {

  var res;

  SignUpFailed({this.res});
}
