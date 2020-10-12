class LoginModel {
  final String email;
  final String password;
  final String user_id;
  final String member_code;
  final String userName;
  final int status;
  LoginModel(
      {this.email,
      this.password,
      this.member_code,
      this.status,
      this.userName,
      this.user_id});

  factory LoginModel.fromJsonVerified(Map<String, dynamic> json) {
    return LoginModel(
        email: json['response']['email'],
        member_code: json['response']['member_code'],
        status: json['status'],
        userName: json['response']['name'],
        user_id: json['response']['user_id']);
  }

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
