import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/fetch_user_profile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/get_user_id_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/update_user_profile_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/change_password_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserIdUseCase _getUserId;
  final FetchUserProfileUsecase _getUserProfile;
  final UpdateUserProfileUseCase _updateUserProfile;
  final ChangePasswordUseCase _changePassword;

  ProfileBloc({
    required GetUserIdUseCase getUserId,
    required FetchUserProfileUsecase getUserProfile,
    required UpdateUserProfileUseCase updateUserProfile,
    required ChangePasswordUseCase changePassword,
  }) : _getUserId = getUserId,
       _getUserProfile = getUserProfile,
       _updateUserProfile = updateUserProfile,
       _changePassword = changePassword,
       super(ProfileLoading()) {
    on<ProfileStarted>(_onStarted);
    on<ProfileUpdateRequested>(_onUpdateRequested);
    on<ProfilePasswordChangeRequested>(_onPasswordChangeRequested);
    on<PublicProfileRequested>(_onPublicProfileRequested);
  }

  Future<void> _onStarted(
    ProfileStarted event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final userId = await _getUserId();
      if (userId == null) {
        emit(const ProfileError(errorMessage: 'Пользователь не найден'));
        return;
      }
      final userProfile = await _getUserProfile(userId);
      emit(ProfileLoaded(userProfile: userProfile));
    } on AppException catch (e) {
      emit(ProfileError(errorMessage: e.message));
    } catch (_) {
      emit(const ProfileError(errorMessage: 'Не удалось загрузить профиль'));
    }
  }

  Future<void> _onUpdateRequested(
    ProfileUpdateRequested event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await _updateUserProfile(
        nickname: event.nickname,
        bio: event.bio,
        avatarUrl: event.avatarUrl,
      );
      add(ProfileStarted());
    } on AppException catch (e) {
      emit(ProfileError(errorMessage: e.message));
    } catch (_) {
      emit(const ProfileError(errorMessage: 'Не удалось обновить профиль'));
      add(ProfileStarted());
    }
  }

  Future<void> _onPasswordChangeRequested(
    ProfilePasswordChangeRequested event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await _changePassword(event.oldPassword, event.newPassword);
    } on AppException catch (e) {
      emit(ProfileError(errorMessage: e.message));
    } catch (_) {
      emit(const ProfileError(errorMessage: 'Не удалось изменить пароль'));
      add(ProfileStarted());
    }
  }

  Future<void> _onPublicProfileRequested(
    PublicProfileRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final user = await _getUserProfile(event.userId);
      emit(ProfileLoaded(userProfile: user));
    } on AppException catch (e) {
      emit(ProfileError(errorMessage: e.message));
    } catch (_) {
      emit(const ProfileError(errorMessage: 'Не удалось загрузить профиль'));
    }
  }
}
