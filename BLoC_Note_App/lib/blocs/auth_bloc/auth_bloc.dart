import 'package:crud_operations/blocs/auth_bloc/auth_event.dart';
import 'package:crud_operations/blocs/auth_bloc/auth_state.dart';
import 'package:crud_operations/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<LoginUser>(_onLoginUser);
    on<CreateUser>(_onCreateUser);
    on<UserOut>(_onUserOut);
  }

  void _onLoginUser(LoginUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.loginUser(event.email, event.password);
      emit(AuthLoaded());
    } catch (error) {
      emit(AuthError(""));
    }
  }

  void _onCreateUser(CreateUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.createUser(
          event.email, event.password, event.confirmPassword);
      emit(AuthLoaded());
    } catch (error) {
      emit(AuthError(""));
    }
  }

  void _onUserOut(UserOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepository.userOut();
      emit(AuthInitial());
    } catch (error) {
      emit(AuthError(""));
    }
  }
}
