part of 'profile_bloc.dart';

@immutable
class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileStarted extends ProfileEvent {}
