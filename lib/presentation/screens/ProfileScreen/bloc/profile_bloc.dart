import 'package:cyberclub_tournaments/core/error/app_exception.dart';
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
    on<ProfilePasswordChangeRequested>(_onPasswordChangeRequested);
    on<PublicProfileRequested>(_onPublicProfileRequested);
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
    } on AppException catch (e) {
      emit(ProfileError(errorMessage: e.message));
    } catch (e) {
      emit(ProfileError(errorMessage: 'Что-то пошло не так'));
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
      print('Profile was updated');
    } on AppException catch (e) {
      emit(ProfileError(errorMessage: e.message));
    } catch (e) {
      print("CRITICAL PROFILE ERROR: $e");
      emit(ProfileError(errorMessage: 'Что-то пошло не так'));
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
      print('Password was changed in bloc');
    } on AppException catch (e) {
      emit(ProfileError(errorMessage: e.message));
    } catch (e) {
      print("CRITICAL PROFILE ERROR: $e");
      emit(ProfileError(errorMessage: 'Что-то пошло не так'));
      add(ProfileStarted());
    }
  }

  Future<void> _onPublicProfileRequested(
    PublicProfileRequested event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final user = await _userRepository.fetchUserProfile(event.userId);
      emit(ProfileLoaded(userProfile: user));
    } on AppException catch (e) {
      emit(ProfileError(errorMessage: e.message));
    } catch (e) {
      emit(ProfileError(errorMessage: 'Что-то пошло не так'));
    }
  }
}
