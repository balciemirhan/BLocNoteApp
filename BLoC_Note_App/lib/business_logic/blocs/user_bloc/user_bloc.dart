import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud_operations/business_logic/blocs/user_bloc/user_event.dart';
import 'package:crud_operations/business_logic/blocs/user_bloc/user_state.dart';
import 'package:crud_operations/business_logic/repositories/user_repository.dart';
import 'package:crud_operations/models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserInitial()) {
    on<AddUser>(_onAddUser);
    on<GetUser>(_onGetUser);
    on<UpdateUser>(_onUpdateUser);
    on<DeleteUser>(_onDeleteUser);
  }

  void _onAddUser(AddUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      await _userRepository.addUser(event.userModel);
      emit(UserLoaded(null));
    } catch (error) {
      emit(UserError(message: error.toString()));
    }
  }

  void _onGetUser(GetUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user = await _userRepository
          .getUser(UserModel(userId: event.userModel.userId));
      emit(UserLoaded(user));
    } catch (error) {
      emit(UserError(message: error.toString()));
    }
  }

  void _onUpdateUser(UpdateUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      await _userRepository.updateUser(event.userModel);
      emit(UserLoaded(null));
    } catch (error) {
      emit(UserError(message: error.toString()));
    }
  }

  void _onDeleteUser(DeleteUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      await _userRepository.deleteUser(event.userModel);
      emit(UserInitial());
    } catch (error) {
      emit(UserError(message: error.toString()));
    }
  }
}
