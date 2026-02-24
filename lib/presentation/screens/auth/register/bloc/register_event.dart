part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String nickname;
  final String email;
  final String password;

  RegisterSubmitted({
    required this.nickname,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [nickname, email, password];
}
