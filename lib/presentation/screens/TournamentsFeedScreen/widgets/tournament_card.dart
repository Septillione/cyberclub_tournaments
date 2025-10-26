import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/subscreens/tournament_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TournamentCard extends StatelessWidget {
  final TournamentModel tournament;

  const TournamentCard({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => TournamentDetailScreen()),
        );
      },
      borderRadius: BorderRadius.circular(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildImage(), _buildInfoBlock()],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(tournament.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withValues(alpha: 0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildDisciplineTag(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDisciplineTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.bgSurface.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(tournament.discipline, style: AppTextStyles.bodyL),
    );
  }

  Widget _buildInfoBlock() {
    return Container(
      color: AppColors.bgSurface,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tournament.title,
            style: AppTextStyles.h3,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8),
          _buildStatusTag(tournament.status),
          SizedBox(height: 16),
          _buildMetadata(),
          SizedBox(height: 16),
          _buildLineParticipants(),
        ],
      ),
    );
  }

  Widget _buildStatusTag(TournamentStatus status) {
    String text;
    Color color;

    switch (status) {
      case TournamentStatus.announced:
        text = 'Анонс';
        color = AppColors.accentPrimary.withOpacity(0.5);
        break;
      case TournamentStatus.registrationOpened:
        text = 'Регистрация открыта';
        color = AppColors.statusSuccess;
        break;
      case TournamentStatus.registrationClosed:
        text = 'Регистрация закрыта';
        color = AppColors.statusWarning;
        break;
      case TournamentStatus.live:
        text = 'Идет';
        color = AppColors.statusLive;
        break;
      case TournamentStatus.finished:
        text = 'Завершен';
        color = AppColors.statusArchived;
        break;
      case TournamentStatus.cancelled:
        text = 'Отменен';
        color = AppColors.statusArchived.withOpacity(0.5);
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Text(
          text,
          style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary),
        ),
      ),
    );
  }

  Widget _buildMetadata() {
    final formattedDate = DateFormat(
      'd MMMM, HH:mm',
      'ru_RU',
    ).format(tournament.startDate);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(LucideIcons.calendar, color: AppColors.textSecondary, size: 16),
        SizedBox(width: 8),
        Text(
          formattedDate,
          style: AppTextStyles.bodyM.copyWith(color: AppColors.textSecondary),
        ),
        SizedBox(width: 16),
        Icon(LucideIcons.trophy, color: AppColors.textSecondary, size: 16),
        SizedBox(width: 8),
        Text(
          tournament.prizePool,
          style: AppTextStyles.bodyM.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildLineParticipants() {
    final double progress =
        tournament.currentParticipants / tournament.maxParticipants;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Участники', style: AppTextStyles.caption),
            Text(
              '${tournament.currentParticipants}/${tournament.maxParticipants}',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          color: AppColors.accentPrimary,
          backgroundColor: AppColors.bgMain,
          value: progress,
          minHeight: 6,
          borderRadius: BorderRadius.circular(20),
        ),
      ],
    );
  }
}
