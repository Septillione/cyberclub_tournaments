part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String nickname;
  final String email;
  final String password;

  const RegisterSubmitted({
    required this.nickname,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [nickname, email, password];
}
