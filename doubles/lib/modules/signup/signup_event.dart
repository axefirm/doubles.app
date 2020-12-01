part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class Signup extends SignupEvent {
  String email;
  String firstName;
  String lastName;
  String grade;
  String university;
  String password;

  Signup(
      {this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.grade,
      this.university});
}
