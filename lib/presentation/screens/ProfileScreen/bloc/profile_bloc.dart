import 'package:cyberclub_tournaments/data/models/UserProfileModel/user_profile_model.dart';
import 'package:cyberclub_tournaments/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;

  ProfileBloc({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(ProfileLoading()) {
    on<ProfileStarted>(_onStarted);
  }

  Future<void> _onStarted(
    ProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final userProfile = await _userRepository.fetchUserProfile();
      emit(ProfileLoaded(userProfile: userProfile));
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    }
  }
}
