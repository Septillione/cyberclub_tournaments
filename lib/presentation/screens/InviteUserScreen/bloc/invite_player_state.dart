part of 'invite_player_bloc.dart';

enum InviteStatus { initial, loading, success, failure }

class InvitePlayerState extends Equatable {
  final InviteStatus status;
  final List<TeamUserShort> users;
  final String errorMessage;
  final String? successMessage;

  const InvitePlayerState({
    this.status = InviteStatus.initial,
    this.users = const [],
    this.errorMessage = '',
    this.successMessage,
  });

  InvitePlayerState copyWith({
    InviteStatus? status,
    List<TeamUserShort>? users,
    String? errorMessage,
    String? successMessage,
  }) {
    return InvitePlayerState(
      status: status ?? this.status,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props => [status, users, errorMessage, successMessage];
}
