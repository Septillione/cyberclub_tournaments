import 'package:cyberclub_tournaments/presentation/widgetsnew/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/bloc/profile_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/widgets/profile_header.dart';
import 'package:cyberclub_tournaments/presentation/screens/profile/widgets/profile_stats.dart';

class PublicProfileScreen extends StatelessWidget {
  final String userId;

  const PublicProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          serviceLocator<ProfileBloc>()
            ..add(PublicProfileRequested(userId: userId)),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return switch (state) {
                  ProfileLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  ProfileError(:final errorMessage) => Center(
                    child: Text('Ошибка: $errorMessage'),
                  ),
                  ProfileLoaded(:final userProfile) => Column(
                    children: [
                      Row(
                        children: [
                          const CustomBackButton(),
                          const SizedBox(width: 16),
                          Text('Профиль игрока', style: AppTextStyles.h2),
                        ],
                      ),
                      const SizedBox(height: 24),
                      ProfileHeader(user: userProfile),
                      const SizedBox(height: 24),
                      ProfileStats(stats: userProfile.stats),
                    ],
                  ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}
