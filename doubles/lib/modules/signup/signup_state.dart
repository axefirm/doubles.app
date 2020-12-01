part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {

  var res;

  SignupSuccess({this.res});
}

class SignupFailed extends SignupState {

  var res;

  SignupFailed({this.res});
}
