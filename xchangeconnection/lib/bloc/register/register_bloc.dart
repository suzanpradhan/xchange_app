import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xchangeconnection/api/repository/api_repo.dart';
import 'package:xchangeconnection/models/register_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final ApiRepo apiRepo;
  RegisterBloc(this.apiRepo) : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    yield RegisterInitial();

    if (event is RegisterFormSubmitted) {
      if (event.name == "" || event.email == "" || event.password == "") {
        yield RegistrationFieldErrorState(error: "Please fill up the form.");
      } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(event.email)) {
        yield RegistrationFieldErrorState(
            error: "Enter a valid email address.");
      } else if (event.password != event.confirmPassword) {
        yield RegistrationFieldErrorState(
            error: "Confirm Password should be same.");
      } else if (event.password.length < 6) {
        yield RegistrationFieldErrorState(
            error: "Password should be at least 6 digit.");
      } else {
        try {
          await apiRepo.register(RegisterModel(
              firstName: event.name,
              email: event.email,
              password: event.password));
          yield RegistrationSuccesState();
        } catch (e) {
          yield RegistrationErrorState(error: e.toString());
        }
      }
    }
  }
}
