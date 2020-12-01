part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class Login extends LoginEvent{
  String email;
  String password;

  Login(this.email, this.password);
}