import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/UserProfileModel/user_profile_model.dart';
import 'package:cyberclub_tournaments/data/repositories/user_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/bloc/profile_bloc.dart';
import 'package:cyberclub_tournaments/presentation/widgets/avatar_picker.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class EditProfileScreen extends StatelessWidget {
  final UserProfileModel userProfile;
  const EditProfileScreen({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    final nicknameController = TextEditingController(
      text: userProfile.nickname,
    );
    final bioController = TextEditingController(text: userProfile.bio);
    final avatarUrlController = TextEditingController(
      text: userProfile.avatarUrl,
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(),

              const SizedBox(height: 16),

              Text('Редактировать профиль', style: AppTextStyles.h2),

              const SizedBox(height: 24),

              AvatarPicker(
                initialUrl: userProfile.avatarUrl,
                uploadFunction: (path) =>
                    context.read<UserRepository>().uploadUserAvatar(path),
                onUploadComplete: (url) {
                  print("URL RECEIVED IN SCREEN: $url");
                  avatarUrlController.text = url;
                },
              ),

              const SizedBox(height: 24),

              TextFormField(
                controller: nicknameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Никнейм',
                  prefixIcon: Icon(LucideIcons.shield),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите никнейм';
                  }
                  if (value.length < 3) {
                    return 'Минимум 3 символа';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'О себе',
                  alignLabelWithHint: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Icon(LucideIcons.fileText),
                  ),
                ),
                maxLines: 3,
                controller: bioController,
                validator: (value) {
                  if (value!.length > 300) {
                    return 'Максимум 300 символов';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 40),

              GradientButton(
                text: 'Сохранить',
                onPressed: () {
                  final newAvatarUrl = avatarUrlController.text.trim();
                  print("UPDATING PROFILE. Avatar: $newAvatarUrl");

                  context.read<ProfileBloc>().add(
                    ProfileUpdateRequested(
                      nickname: nicknameController.text.trim(),
                      bio: bioController.text.trim(),
                      avatarUrl: newAvatarUrl.isNotEmpty ? newAvatarUrl : null,
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
