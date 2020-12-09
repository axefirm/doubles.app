import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doubles/data/api/api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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
    print("login");

    QueryResult res = await Api.login(event.email, event.password);
    print("res");
    print(res.data["login"]["token"]);
    if(res.data["login"]["success"]){
      final _storage = FlutterSecureStorage();
      print(res);
      print(res.data["login"]["data"]["_id"]);
      // assert(token != null);
      await _storage.write(key: "userId", value: res.data["login"]["data"]["_id"]);
      yield LoginSuccess(res: res);
    }else{
      yield LoginFailed(res: res.data["login"]["message"]);
    }
  } catch (e) {
    print(e);
    yield LoginFailed(res: "Алдаа гарлаа системийн админд хандана уу");
  }
}
