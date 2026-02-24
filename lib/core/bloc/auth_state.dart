import 'package:cyberclub_tournaments/data/models/UserProfileModel/user_profile_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String userId;
  final UserRole role;

  AuthAuthenticated({required this.userId, required this.role});

  @override
  List<Object?> get props => [userId, role];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

// part of 'auth_bloc.dart';

// sealed class AuthState extends Equatable {
//   const AuthState();

//   @override
//   List<Object> get props => [];
// }

// class AuthAuthenticated extends AuthState {}

// class AuthUnauthenticated extends AuthState {}

// class AuthUnknown extends AuthState {}
