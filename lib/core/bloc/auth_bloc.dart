import 'package:cyberclub_tournaments/core/bloc/auth_event.dart';
import 'package:cyberclub_tournaments/core/bloc/auth_state.dart';
import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/get_user_id_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/get_user_role_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/is_logged_in_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/login_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/logout_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsLoggedInUseCase _isLoggedIn;
  final LoginUseCase _login;
  final RegisterUseCase _register;
  final LogoutUseCase _logout;
  final GetUserRoleUseCase _getRole;
  final GetUserIdUseCase _getUserId;

  AuthBloc({
    required IsLoggedInUseCase isLoggedIn,
    required LoginUseCase login,
    required RegisterUseCase register,
    required LogoutUseCase logout,
    required GetUserRoleUseCase getRole,
    required GetUserIdUseCase getUserId,
  }) : _isLoggedIn = isLoggedIn,
       _login = login,
       _register = register,
       _logout = logout,
       _getRole = getRole,
       _getUserId = getUserId,
       super(AuthInitial()) {
    on<AuthCheckRequested>(_onCheckRequested);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    print('AUTH BLOC: Проверка авторизации началась...');
    emit(AuthLoading());
    try {
      final loggedIn = await _isLoggedIn();
      print('AUTH BLOC: Результат проверки: $loggedIn');
      if (loggedIn) {
        await _emitAuthenticated(emit);
        print('AUTH BLOC: Состояние -> Authenticated');
      } else {
        emit(AuthUnauthenticated());
        print('AUTH BLOC: Состояние -> Unauthenticated');
      }
    } catch (e) {
      print('AUTH BLOC ERROR: $e');
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _login(event.email, event.password);
      await _emitAuthenticated(emit);
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _register(
        email: event.email,
        password: event.password,
        nickname: event.nickname,
      );
      await _emitAuthenticated(emit);
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _logout();
    emit(AuthUnauthenticated());
  }

  // Приватный хелпер — убираем дублирование
  Future<void> _emitAuthenticated(Emitter<AuthState> emit) async {
    final roleStr = await _getRole();
    final userId = await _getUserId();

    final role = _parseRole(roleStr);

    emit(AuthAuthenticated(userId: userId ?? '', role: role));
  }

  UserRole _parseRole(String? role) {
    switch (role) {
      case 'MANAGER':
        return UserRole.manager;
      case 'ADMIN':
        return UserRole.admin;
      default:
        return UserRole.user;
    }
  }
}

// import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
// import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final AuthRepository _authRepository;

//   AuthBloc({required AuthRepository authRepository})
//     : _authRepository = authRepository,
//       super(AuthUnknown()) {
//     on<AuthCheckRequested>(_onAuthCheckRequested);
//   }

//   Future<void> _onAuthCheckRequested(
//     AuthCheckRequested event,
//     Emitter<AuthState> emit,
//   ) async {
//     final log = await _authRepository.isLoggedIn();
//     if (log) {
//       emit(AuthAuthenticated());
//     } else {
//       emit(AuthUnauthenticated());
//     }
//   }
// }
