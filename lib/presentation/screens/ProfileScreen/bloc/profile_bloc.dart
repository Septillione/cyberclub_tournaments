import 'package:cyberclub_tournaments/data/models/UserProfileModel/user_profile_model.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;

  ProfileBloc({
    required UserRepository userRepository,
    required AuthRepository authRepository,
  }) : _userRepository = userRepository,
       _authRepository = authRepository,
       super(ProfileLoading()) {
    on<ProfileStarted>(_onStarted);
    on<ProfileUpdateRequested>(_onUpdateRequested);
  }

  Future<void> _onStarted(
    ProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final currentUserId = await _authRepository.getUserId();
      final userProfile = await _userRepository.fetchUserProfile(
        currentUserId ?? '',
      );
      emit(ProfileLoaded(userProfile: userProfile));
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
    }
  }

  Future<void> _onUpdateRequested(
    ProfileUpdateRequested event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await _userRepository.updateUserProfile(
        nickname: event.nickname,
        bio: event.bio,
        avatarUrl: event.avatarUrl,
      );
      add(ProfileStarted());
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
      add(ProfileStarted());
    }
  }

  Future<void> _onPasswordChangeRequested(
    ProfilePasswordChangeRequested event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await _userRepository.changePassword(
        event.oldPassword,
        event.newPassword,
      );
    } catch (e) {
      emit(ProfileError(errorMessage: e.toString()));
      add(ProfileStarted());
    }
  }
}
