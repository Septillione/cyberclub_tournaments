import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TournamentCard extends StatelessWidget {
  final TournamentModel tournament;

  const TournamentCard({super.key, required this.tournament});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24.0),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/tournaments/${tournament.id}'),
        borderRadius: BorderRadius.circular(24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildImage(), _buildInfoBlock()],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    final imageUrl = tournament.imageUrl;
    ImageProvider imageProvider;

    if (imageUrl.startsWith('http')) {
      imageProvider = NetworkImage(imageUrl);
    } else {
      imageProvider = AssetImage(imageUrl);
    }

    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
      child: Text(tournament.discipline.title, style: AppTextStyles.bodyL),
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
      case TournamentStatus.ANNOUNCED:
        text = 'Анонс';
        color = AppColors.accentPrimary.withValues(alpha: 0.5);
        break;
      case TournamentStatus.REGISTRATION_OPEN:
        text = 'Регистрация открыта';
        color = AppColors.greenColor;
        break;
      case TournamentStatus.REGISTRATION_CLOSED:
        text = 'Регистрация закрыта';
        color = AppColors.yellowColor;
        break;
      case TournamentStatus.LIVE:
        text = 'Идет';
        color = AppColors.redColor;
        break;
      case TournamentStatus.FINISHED:
        text = 'Завершен';
        color = AppColors.greyColor;
        break;
      case TournamentStatus.CANCELLED:
        text = 'Отменен';
        color = AppColors.greyColor.withValues(alpha: 0.5);
        break;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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

    String topPrize = 'Призы';

    if (tournament.prizes.isNotEmpty) {
      topPrize = tournament.prizes.first.amount;
    }

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
          topPrize,
          style: AppTextStyles.bodyM.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildLineParticipants() {
    final double progress =
        (tournament.participants.current / tournament.participants.max).clamp(
          0.0,
          1.0,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Участники', style: AppTextStyles.caption),
            Text(
              '${tournament.participants.current}/${tournament.participants.max}',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        Container(
          height: 6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.bgMain,
            borderRadius: BorderRadius.circular(20),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [AppColors.gradientDark, AppColors.gradientLight],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
