part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserProfileModel userProfile;

  const ProfileLoaded({required this.userProfile});

  @override
  List<Object> get props => [userProfile];
}

final class ProfileError extends ProfileState {
  final String errorMessage;

  const ProfileError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
