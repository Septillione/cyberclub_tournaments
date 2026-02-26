part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ProfileStarted extends ProfileEvent {}

class ProfileUpdateRequested extends ProfileEvent {
  final String? nickname;
  final String? bio;
  final String? avatarUrl;

  const ProfileUpdateRequested({this.nickname, this.bio, this.avatarUrl});

  @override
  List<Object?> get props => [nickname, bio, avatarUrl];
}

class ProfilePasswordChangeRequested extends ProfileEvent {
  final String oldPassword;
  final String newPassword;

  const ProfilePasswordChangeRequested({
    required this.oldPassword,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [oldPassword, newPassword];
}

class PublicProfileRequested extends ProfileEvent {
  final String userId;

  const PublicProfileRequested({required this.userId});

  @override
  List<Object?> get props => [userId];
}
