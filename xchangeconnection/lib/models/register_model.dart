class RegisterModel {
  final String firstName;
  final String email;
  final String password;
  final int member_code;
  final String message;
  final int status;
  final String nameError;
  final String emailError;
  final String passwordError;
  RegisterModel(
      {this.firstName,
      this.email,
      this.emailError,
      this.nameError,
      this.passwordError,
      this.password,
      this.member_code,
      this.status,
      this.message});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        message: json['message'],
        member_code: json['response']['member_code'],
        status: json['status'],
        firstName: json['response']['first_name'],
        email: json['email'],
        emailError: json['error']['email'],
        nameError: json['error']['name'],
        passwordError: json['error']['password']);
  }

  Map<String, dynamic> toJson() =>
      {'name': firstName, 'email': email, 'password': password};
}
