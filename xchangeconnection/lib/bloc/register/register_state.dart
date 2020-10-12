part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterSubmittedState extends RegisterState {
  final RegisterModel registerModel;
  const RegisterSubmittedState({this.registerModel});

  @override
  List<Object> get props => [registerModel];
}

class RegistrationFieldErrorState extends RegisterState {
  final String error;
  const RegistrationFieldErrorState({this.error});

  @override
  List<Object> get props => [error];
}

class RegistrationSuccesState extends RegisterState {}

class RegistrationErrorState extends RegisterState {
  final String error;
  const RegistrationErrorState({this.error});

  @override
  List<Object> get props => [error];
}
