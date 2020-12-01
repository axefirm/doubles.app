import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doubles/data/api/api.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login) {
      yield* _mapLogin(event);
    }
  }
}

Stream<LoginState> _mapLogin(Login event) async* {
  try {
    yield LoginLoading();

    final token = await Api.login(event.email, event.password);
  } catch (e) {
    yield LoginFailed(res: "failed");
  }
}
