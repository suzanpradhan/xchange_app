part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSubmittedState extends LoginState {
  final LoginModel loginModel;
  const LoginSubmittedState({this.loginModel});

  @override
  List<Object> get props => [loginModel];
}

class LoginVerifiedState extends LoginState {
  final LoginModel loginModel;
  const LoginVerifiedState({this.loginModel});

  @override
  List<Object> get props => [loginModel];
}

class LoginFieldErrorState extends LoginState {
  final String error;
  const LoginFieldErrorState({this.error});

  @override
  List<Object> get props => [error];
}

class LoginErrorState extends LoginState {
  final String errors;
  const LoginErrorState({this.errors});

  @override
  List<Object> get props => [errors];
}
