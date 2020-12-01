import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doubles/data/api/api.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is Signup) {
      yield* _mapSignup(event);
    }
  }
}

Stream<SignupState> _mapSignup(Signup event) async* {
  try {
    yield SignupLoading();

    var res = await Api.signUp(event);
  } catch (e) {
    yield SignupFailed(res: "failed");
  }
}
