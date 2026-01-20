import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/UserProfileModel/user_profile_model.dart';
import 'package:cyberclub_tournaments/data/repositories/auth_repository.dart';
import 'package:cyberclub_tournaments/data/repositories/user_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/ProfileScreen/bloc/profile_bloc.dart';
import 'package:cyberclub_tournaments/presentation/widgets/card_statistics.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PublicProfileScreen extends StatelessWidget {
  final String userId;

  const PublicProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        userRepository: context.read<UserRepository>(),
        authRepository: context.read<AuthRepository>(),
      )..add(PublicProfileRequested(userId: userId)),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 20.0),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                switch (state) {
                  case ProfileLoading():
                    return const Center(child: CircularProgressIndicator());
                  case ProfileError():
                    return Center(child: Text('Ошибка: ${state.errorMessage}'));
                  case ProfileLoaded():
                    final user = state.userProfile;

                    final tournamentCount = user.entries.length;
                    final winsCount = 0;
                    final winrate = tournamentCount > 0
                        ? ((winsCount / tournamentCount) * 100).toStringAsFixed(
                            0,
                          )
                        : '0';
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTop(context),
                        const SizedBox(height: 24),
                        Expanded(
                          child: ListView(
                            children: [
                              _buildHeader(user),
                              const SizedBox(height: 24),

                              IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: CardStatistics(
                                        title: 'Турниров',
                                        value: '$tournamentCount',
                                        color: AppColors.blueColor,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: CardStatistics(
                                        title: 'Побед',
                                        value: '$winsCount',
                                        color: AppColors.redColor,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: CardStatistics(
                                        title: 'Winrate',
                                        value: '$winrate%',
                                        color: AppColors.greenColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Row _buildTop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(),
        Text('Профиль игрока', style: AppTextStyles.h2),
      ],
    );
  }

  Widget _buildHeader(UserProfileModel user) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 72,
          backgroundImage: user.avatarUrl != null
              ? NetworkImage(user.avatarUrl!)
              : null,
          child: user.avatarUrl != null
              ? null
              : const Icon(
                  LucideIcons.circleUserRound,
                  size: 80,
                  color: AppColors.textSecondary,
                ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.nickname,
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text('${user.bio}'),
            ],
          ),
        ),
      ],
    );
  }
}
