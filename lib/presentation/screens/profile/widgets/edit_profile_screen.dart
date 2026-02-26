import 'package:cyberclub_tournaments/presentation/widgetsnew/avatar_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/user/upload_user_avatar_usecase.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/bloc/profile_bloc.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/gradient_button.dart';

class EditProfileScreen extends StatelessWidget {
  final UserEntity userProfile;

  const EditProfileScreen({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    // Получаем существующий блок профиля
    // или создаём новый если передан через extra
    return _EditProfileView(userProfile: userProfile);
  }
}

class _EditProfileView extends StatelessWidget {
  final UserEntity userProfile;

  const _EditProfileView({required this.userProfile});

  @override
  Widget build(BuildContext context) {
    final nicknameController = TextEditingController(
      text: userProfile.nickname,
    );
    final bioController = TextEditingController(text: userProfile.bio);
    String? avatarUrl = userProfile.avatarUrl;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              const SizedBox(height: 16),
              Text('Редактировать профиль', style: AppTextStyles.h2),
              const SizedBox(height: 24),

              AvatarPicker(
                initialUrl: avatarUrl,
                customUpload: (path) =>
                    serviceLocator<UploadUserAvatarUseCase>()(path),
                onUploadComplete: (url) => avatarUrl = url,
              ),

              const SizedBox(height: 24),

              TextFormField(
                controller: nicknameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Никнейм',
                  prefixIcon: Icon(LucideIcons.shield),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: bioController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'О себе',
                  alignLabelWithHint: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Icon(LucideIcons.fileText),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              GradientButton(
                text: 'Сохранить',
                onPressed: () {
                  context.read<ProfileBloc>().add(
                    ProfileUpdateRequested(
                      nickname: nicknameController.text.trim(),
                      bio: bioController.text.trim(),
                      avatarUrl: avatarUrl,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
