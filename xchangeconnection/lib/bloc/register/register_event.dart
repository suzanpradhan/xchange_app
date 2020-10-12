part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterFormSubmitted extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  const RegisterFormSubmitted(
      {this.name, this.email, this.password, this.confirmPassword});

  @override
  List<Object> get props => [name, email, password];
}
