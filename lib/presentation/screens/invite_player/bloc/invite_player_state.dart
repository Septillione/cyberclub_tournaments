part of 'invite_player_bloc.dart';

enum InviteStatus { initial, loading, success, failure }

class InvitePlayerState extends Equatable {
  final InviteStatus status;
  final List<TeamUserShort> users;
  final String? successMessage;
  final String? errorMessage;

  const InvitePlayerState({
    this.status = InviteStatus.initial,
    this.users = const [],
    this.successMessage,
    this.errorMessage,
  });

  InvitePlayerState copyWith({
    InviteStatus? status,
    List<TeamUserShort>? users,
    String? successMessage,
    String? errorMessage,
    bool clearSuccess = false,
    bool clearError = false,
  }) {
    return InvitePlayerState(
      status: status ?? this.status,
      users: users ?? this.users,
      successMessage: clearSuccess
          ? null
          : (successMessage ?? this.successMessage),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [status, users, successMessage, errorMessage];
}
