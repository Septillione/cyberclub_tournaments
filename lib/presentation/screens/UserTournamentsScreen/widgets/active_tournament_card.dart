import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ActiveTournamentCard extends StatelessWidget {
  final TournamentModel tournament;

  const ActiveTournamentCard({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/tournaments/${tournament.id}'),
      // onTap: () {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (context) =>
      //           TournamentDetailScreen(tournament: tournament),
      //     ),
      //   );
      // },
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            Text(
              '${tournament.discipline}, ${tournament.formatVersus}, ${tournament.format}',
              style: AppTextStyles.bodyM,
            ),
            SizedBox(height: 16),
            const Divider(color: AppColors.bgMain, height: 1),
            SizedBox(height: 16),
            _buildNextMatchCard(),
          ],
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(tournament.title, style: AppTextStyles.h3),
        Container(
          decoration: BoxDecoration(
            color: AppColors.statusLive,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              'Live',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildNextMatchCard() {
    final formattedDate = DateFormat(
      'HH:mm',
      'ru_RU',
    ).format(tournament.startDate);

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.bgMain,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.accentPrimary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Следующий матч', style: AppTextStyles.bodyM),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTeam('Ваша\nкоманда', isUserTeam: true),
              Text('vs', style: AppTextStyles.bodyM),
              _buildTeam('Team\nBravo'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    LucideIcons.calendar,
                    color: AppColors.textSecondary,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text('Сегодня в $formattedDate', style: AppTextStyles.bodyM),
                ],
              ),
              const Icon(LucideIcons.arrowRight, color: AppColors.textPrimary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeam(String name, {bool isUserTeam = false}) {
    if (isUserTeam) {
      return Row(
        children: [
          Icon(LucideIcons.shield, size: 24, color: AppColors.accentPrimary),
          const SizedBox(width: 8),
          SizedBox(
            width: 100,
            child: Text(
              name,
              style: AppTextStyles.button,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              name,
              style: AppTextStyles.button,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Icon(LucideIcons.shield, size: 24, color: AppColors.textSecondary),
        ],
      );
    }
  }
}
