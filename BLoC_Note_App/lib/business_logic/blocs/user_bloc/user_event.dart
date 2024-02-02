import 'package:crud_operations/models/user_model.dart';

abstract class UserEvent {}

class AddUser extends UserEvent {
  final UserModel userModel;

  AddUser({required this.userModel});
}

class GetUser extends UserEvent {
  final UserModel userModel;

  GetUser({required this.userModel});
}

class UpdateUser extends UserEvent {
  final UserModel userModel;

  UpdateUser({required this.userModel});
}

class DeleteUser extends UserEvent {
  final UserModel userModel;

  DeleteUser({required this.userModel});
}
