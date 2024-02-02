// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  final String email;
  final String password;

  LoginUser({required this.email, required this.password});
}

class CreateUser extends AuthEvent {
  final String email;

  final String password;
  final String confirmPassword;

  CreateUser({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class UserOut extends AuthEvent {}
