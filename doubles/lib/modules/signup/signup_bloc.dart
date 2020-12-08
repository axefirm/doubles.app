import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doubles/data/api/api.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is Signup) {
      yield* _mapSignup(event);
    }
  }
}

Stream<SignUpState> _mapSignup(Signup event) async* {
  try {
    yield SignUpLoading();

    var res = await Api.signUp(event);
    yield SignUpSuccess(res: res);
  } catch (e) {
    yield SignUpFailed(res: "failed");
  }
}
