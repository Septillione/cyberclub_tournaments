import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/widgets/tournament_infoblock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class GeneralDetails extends StatelessWidget {
  final TournamentModel tournament;

  const GeneralDetails({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'dd.MM.yyyy\nHH:mm МСК',
      'ru_RU',
    ).format(tournament.startDate);

    final participants =
        '${tournament.participants.current}/${tournament.participants.max}';

    final tournamentFormat =
        '${tournament.teamMode.title}\n${tournament.bracketType.title}';

    final List<Widget> infoItemsGrid = [
      TournamentInfoItem(
        title: 'Дата и время',
        icon: LucideIcons.calendar,
        colorIcon: AppColors.accentPrimary,
        bodyText: formattedDate,
      ),
      if (tournament.isOnline == true) ...[
        TournamentInfoItem(
          title: 'Адрес',
          icon: LucideIcons.mapPin,
          colorIcon: AppColors.redColor,
          bodyText: 'Онлайн',
        ),
      ] else ...[
        TournamentInfoItem(
          title: 'Адрес',
          icon: LucideIcons.mapPin,
          colorIcon: AppColors.redColor,
          bodyText: tournament.address ?? '',
        ),
      ],
      TournamentInfoItem(
        title: 'Формат',
        icon: LucideIcons.swords,
        colorIcon: AppColors.yellowColor,
        bodyText: tournamentFormat,
      ),
      TournamentInfoItem(
        title: 'Участников',
        icon: LucideIcons.usersRound,
        colorIcon: AppColors.greenColor,
        bodyText: participants,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoGrid(infoItemsGrid),
        const SizedBox(height: 32),
        _buildInfoBlock(),
      ],
    );
  }

  LayoutBuilder _buildInfoGrid(List<Widget> infoItems) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return IntrinsicHeight(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: infoItems[0]),
                    const SizedBox(width: 16),
                    Expanded(child: infoItems[1]),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: infoItems[2]),
                    const SizedBox(width: 16),
                    Expanded(child: infoItems[3]),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Column _buildInfoBlock() {
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
        const SizedBox(height: 32),

        if (tournament.prizes.isNotEmpty)
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.bgSurface,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Призы и награды', style: AppTextStyles.h3),
                const SizedBox(height: 12),

                ...tournament.prizes.map((prize) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          LucideIcons.medal,
                          size: 20,
                          color: AppColors.accentPrimary,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${prize.label}: ',
                          style: AppTextStyles.bodyL.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(prize.amount, style: AppTextStyles.bodyL),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        SizedBox(height: 16),
      ],
    );
  }
}
