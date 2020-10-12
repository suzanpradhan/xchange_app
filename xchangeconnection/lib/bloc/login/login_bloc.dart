import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/semantics.dart';
import 'package:xchangeconnection/api/repository/api_repo.dart';
import 'package:xchangeconnection/models/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepo apiRepo;
  LoginBloc(this.apiRepo) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    yield LoginInitial();
    if (event is LoginFormSubmitted) {
      try {
        if (event.email == "" || event.password == "") {
          yield LoginFieldErrorState(error: "Please fill up the form!");
        } else if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(event.email)) {
          yield LoginFieldErrorState(error: "Enter a valid email address.");
        } else {
          LoginModel _responseModel = await apiRepo
              .login(LoginModel(email: event.email, password: event.password));
          if (_responseModel.status == 200) {
            yield LoginVerifiedState(loginModel: _responseModel);
          }
        }
      } catch (e) {
        yield LoginErrorState(errors: e.toString());
      }
    }
  }
}
