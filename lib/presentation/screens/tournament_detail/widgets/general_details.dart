import 'package:cyberclub_tournaments/presentation/screens/tournament_detail/widgets/tournament_info_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';

class GeneralDetails extends StatelessWidget {
  final TournamentEntity tournament;

  const GeneralDetails({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoGrid(),
        const SizedBox(height: 32),
        _buildDescription(),
        const SizedBox(height: 32),
        if (tournament.prizes.isNotEmpty) _buildPrizes(),
      ],
    );
  }

  Widget _buildInfoGrid() {
    final date = DateFormat(
      'dd.MM.yyyy\nHH:mm МСК',
      'ru',
    ).format(tournament.startDate);
    final participants =
        '${tournament.participants.current}/${tournament.participants.max}';
    final format =
        '${tournament.teamMode.title}\n${tournament.bracketType.title}';

    return LayoutBuilder(
      builder: (context, constraints) {
        return IntrinsicHeight(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TournamentInfoItem(
                        title: 'Дата',
                        icon: LucideIcons.calendar,
                        color: AppColors.blueColor,
                        bodyText: date,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TournamentInfoItem(
                        title: 'Адрес',
                        icon: LucideIcons.mapPin,
                        color: AppColors.redColor,
                        bodyText: tournament.isOnline
                            ? 'Онлайн'
                            : (tournament.address ?? ''),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TournamentInfoItem(
                        title: 'Формат',
                        icon: LucideIcons.swords,
                        color: AppColors.yellowColor,
                        bodyText: format,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TournamentInfoItem(
                        title: 'Участников',
                        icon: LucideIcons.usersRound,
                        color: AppColors.greenColor,
                        bodyText: participants,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Описание', style: AppTextStyles.h3),
        const SizedBox(height: 16),
        Text(
          tournament.description,
          style: AppTextStyles.bodyL.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(height: 32),
        Text('Правила', style: AppTextStyles.h3),
        const SizedBox(height: 16),
        Text(
          tournament.rules,
          style: AppTextStyles.bodyL.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildPrizes() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [AppColors.yellowColor, AppColors.accentPrimary],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Призы', style: AppTextStyles.h3),
            const SizedBox(height: 12),
            ...tournament.prizes.map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(
                      LucideIcons.medal,
                      size: 20,
                      color: AppColors.accentPrimary,
                    ),
                    const SizedBox(width: 12),
                    Text('${p.label}: ', style: AppTextStyles.bodyL),
                    Text(p.amount, style: AppTextStyles.bodyL),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
