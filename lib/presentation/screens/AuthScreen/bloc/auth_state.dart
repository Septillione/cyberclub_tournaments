part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {
  final String errorMessage;

  const LoginFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
