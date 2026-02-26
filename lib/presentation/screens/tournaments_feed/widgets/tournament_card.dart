import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';

class TournamentCard extends StatelessWidget {
  final TournamentEntity tournament;
  final bool isManager;
  final Function(String id)? onCancel;

  const TournamentCard({
    super.key,
    required this.tournament,
    this.isManager = false,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/tournaments/${tournament.id}'),
        borderRadius: BorderRadius.circular(24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeaderImage(tournament: tournament),
              _InfoBlock(
                tournament: tournament,
                isManager: isManager,
                onCancel: onCancel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  final TournamentEntity tournament;

  const _HeaderImage({required this.tournament});

  @override
  Widget build(BuildContext context) {
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
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
          padding: const EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.bgSurface.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              tournament.discipline.title,
              style: AppTextStyles.bodyL,
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final TournamentEntity tournament;
  final bool isManager;
  final Function(String id)? onCancel;

  const _InfoBlock({
    required this.tournament,
    required this.isManager,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  tournament.title,
                  style: AppTextStyles.h3,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isManager)
                _AdminMenu(tournament: tournament, onCancel: onCancel),
            ],
          ),
          const SizedBox(height: 8),
          _StatusTag(status: tournament.status),
          const SizedBox(height: 16),
          _Metadata(tournament: tournament),
          const SizedBox(height: 16),
          _ParticipantsLine(tournament: tournament),
        ],
      ),
    );
  }
}

class _StatusTag extends StatelessWidget {
  final TournamentStatus status;

  const _StatusTag({required this.status});

  @override
  Widget build(BuildContext context) {
    final (text, color) = _getStatusStyle(status);

    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1.2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary),
        ),
      ),
    );
  }

  (String, Color) _getStatusStyle(TournamentStatus status) {
    return switch (status) {
      TournamentStatus.announced => (
        'Анонс',
        AppColors.accentPrimary.withOpacity(0.5),
      ),
      TournamentStatus.registrationOpen => (
        'Регистрация открыта',
        AppColors.greenColor,
      ),
      TournamentStatus.registrationClosed => (
        'Регистрация закрыта',
        AppColors.yellowColor,
      ),
      TournamentStatus.live => ('LIVE', AppColors.redColor),
      TournamentStatus.finished => ('Завершен', AppColors.greyColor),
      TournamentStatus.cancelled => (
        'Отменен',
        AppColors.greyColor.withOpacity(0.5),
      ),
    };
  }
}

class _Metadata extends StatelessWidget {
  final TournamentEntity tournament;

  const _Metadata({required this.tournament});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('d MMMM, HH:mm', 'ru').format(tournament.startDate);
    final prize = tournament.prizes.isNotEmpty
        ? tournament.prizes.first.amount
        : 'Призы';

    return Row(
      children: [
        const Icon(
          LucideIcons.calendar,
          color: AppColors.textSecondary,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          date,
          style: AppTextStyles.bodyM.copyWith(color: AppColors.textSecondary),
        ),
        const SizedBox(width: 16),
        const Icon(
          LucideIcons.trophy,
          color: AppColors.textSecondary,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          prize,
          style: AppTextStyles.bodyM.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class _ParticipantsLine extends StatelessWidget {
  final TournamentEntity tournament;

  const _ParticipantsLine({required this.tournament});

  @override
  Widget build(BuildContext context) {
    final progress =
        (tournament.participants.current / tournament.participants.max).clamp(
          0.0,
          1.0,
        );

    return Column(
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
        LinearProgressIndicator(
          value: progress,
          backgroundColor: AppColors.bgMain,
          color: AppColors.accentPrimary,
          minHeight: 6,
          borderRadius: BorderRadius.circular(20),
        ),
      ],
    );
  }
}

class _AdminMenu extends StatelessWidget {
  final TournamentEntity tournament;
  final Function(String id)? onCancel;

  const _AdminMenu({required this.tournament, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      elevation: 4,
      color: AppColors.bgSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.bgMain, width: 1),
      ),
      offset: const Offset(0, 50),
      child: const Icon(LucideIcons.ellipsisVertical, size: 24),
      onSelected: (value) => _handleAction(context, value),
      itemBuilder: (_) => [
        const PopupMenuItem(value: 'edit', child: Text('Редактировать')),
        const PopupMenuItem(value: 'cancel', child: Text('Отменить')),
      ],
    );
  }

  void _handleAction(BuildContext context, String action) {
    if (action == 'edit') {
      context.push('/create-tournament', extra: tournament);
    } else if (action == 'cancel') {
      if (onCancel != null) onCancel!(tournament.id);
    }
  }
}
