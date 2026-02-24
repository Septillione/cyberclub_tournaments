import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      await _authRepository.login(event.email, event.password);
      emit(LoginSuccess());
    } on AppException catch (e) {
      emit(LoginFailure(errorMessage: e.message));
    } catch (e) {
      emit(LoginFailure(errorMessage: 'Что-то пошло не так'));
    }
  }
}
