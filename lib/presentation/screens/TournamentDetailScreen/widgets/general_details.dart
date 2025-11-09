import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/widgets/tournament_infoblock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
        '${tournament.currentParticipants ?? 0}/${tournament.maxParticipants ?? 0}';

    final tournamentFormat = '${tournament.formatVersus}\n${tournament.format}';

    final List<Widget> infoItemsGrid = [
      TournamentInfoItem(
        title: 'Дата и время',
        icon: LucideIcons.calendar,
        colorIcon: AppColors.accentPrimary,
        bodyText: formattedDate,
      ),
      TournamentInfoItem(
        title: 'Адрес',
        icon: LucideIcons.mapPin,
        colorIcon: AppColors.statusLive,
        bodyText: tournament.address ?? tournament.type,
      ),
      TournamentInfoItem(
        title: 'Формат',
        icon: LucideIcons.swords,
        colorIcon: AppColors.statusWarning,
        bodyText: tournamentFormat,
      ),
      TournamentInfoItem(
        title: 'Участников',
        icon: LucideIcons.users2,
        colorIcon: AppColors.statusSuccess,
        bodyText: participants,
      ),
    ];

    return Column(
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

        if (tournament.firstPlace != null ||
            tournament.secondPlace != null ||
            tournament.thirdPlace != null)
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
                const SizedBox(height: 4),

                if (tournament.firstPlace != null) ...[
                  const SizedBox(height: 12),
                  _buildPrizeItem(
                    LucideIcons.medal,
                    AppColors.statusWarning,
                    '1 место:',
                    tournament.firstPlace!,
                  ),
                ],

                if (tournament.secondPlace != null) ...[
                  const SizedBox(height: 12),
                  _buildPrizeItem(
                    LucideIcons.medal,
                    AppColors.textSecondary,
                    '2 место:',
                    tournament.secondPlace!,
                  ),
                ],

                if (tournament.thirdPlace != null) ...[
                  const SizedBox(height: 12),
                  _buildPrizeItem(
                    LucideIcons.medal,
                    AppColors.medalBronza,
                    '3 место:',
                    tournament.thirdPlace!,
                  ),
                ],
              ],
            ),
          ),
        SizedBox(height: 32),
      ],
    );
  }

  Widget _buildPrizeItem(
    IconData icon,
    Color color,
    String place,
    String prize,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 24, color: color),
        const SizedBox(width: 12),
        Flexible(child: Text('$place $prize', style: AppTextStyles.bodyL)),
      ],
    );
  }
}
