import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/bloc/profile_bloc.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final newRepeatPasswordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(),

              const SizedBox(height: 16),

              Text('Сменить пароль', style: AppTextStyles.h2),

              const SizedBox(height: 24),

              TextFormField(
                controller: oldPasswordController,
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Старый пароль'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите старый пароль';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 32),

              TextFormField(
                controller: newPasswordController,
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Новый пароль'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите новый пароль';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: newRepeatPasswordController,
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Повторите пароль',
                ),
                validator: (value) {
                  if (value != newPasswordController.text) {
                    return 'Пароли не совпадают';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 40),

              GradientButton(
                text: 'Сохранить',
                onPressed: () {
                  if (newPasswordController.text ==
                      newRepeatPasswordController.text) {
                    context.read<ProfileBloc>().add(
                      ProfilePasswordChangeRequested(
                        oldPassword: oldPasswordController.text,
                        newPassword: newPasswordController.text,
                      ),
                    );
                    print('Password was changed');
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Пароли не совпадают',
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                        backgroundColor: AppColors.bgSurface,
                        duration: Duration(seconds: 1),
                      ),
                    );
                    print('Passwords do not match');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
