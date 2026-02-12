import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/CreateTournamentScreen/bloc/create_tournament_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TournamentCard extends StatelessWidget {
  final TournamentModel tournament;
  final bool? isManager;
  final Function(String id)? onCancelTournament;

  const TournamentCard({
    super.key,
    required this.tournament,
    this.isManager,
    this.onCancelTournament,
  });

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
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),

      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isManager == true || isManager != null)
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
                PopupMenuButton<String>(
                  elevation: 4,
                  color: AppColors.bgSurface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: AppColors.bgMain, width: 1),
                  ),
                  offset: const Offset(0, 50),
                  child: const Icon(LucideIcons.ellipsisVertical, size: 24),
                  itemBuilder: (context) => [
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Text(
                        'Редактировать',
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      onTap: () =>
                          context.push('/create-tournament', extra: tournament),
                    ),
                    PopupMenuItem<String>(
                      value: 'cancel',
                      child: Text(
                        'Отменить',
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      onTap: () =>
                          showCancelTournamentDialog(context, tournament.id),
                    ),
                  ],
                ),
              ],
            )
          else
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
        text = 'LIVE';
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
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1.2),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            text,
            style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary),
          ),
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

  void showCancelTournamentDialog(BuildContext context, String tournamentId) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: AppColors.bgSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.bgMain, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Иконка предупреждения
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.redColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  LucideIcons.triangleAlert,
                  size: 32,
                  color: AppColors.redColor,
                ),
              ),
              const SizedBox(height: 20),

              // Заголовок
              Text(
                'Отменить турнир?',
                style: AppTextStyles.h3,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              // Текст предупреждения
              Text(
                'Вы уверены, что хотите отменить этот турнир? Это действие необратимо. Статус турнира изменится на "Отменен", а участники получат уведомление.',
                style: AppTextStyles.bodyM.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Кнопки
              Row(
                children: [
                  // Кнопка отмены (Назад)
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(color: AppColors.textSecondary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(
                        'Назад',
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Кнопка подтверждения (Удалить)
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Вызов события BLoC
                        // context.read<TournamentBloc>().add(CancelTournamentEvent(tournamentId));
                        context.read<CreateTournamentBloc>().add(
                          CancelTournamentSubmitted(touranmentId: tournamentId),
                        );

                        // if (onCancelTournament != null) {
                        //   onCancelTournament!(tournamentId);
                        // }

                        Navigator.pop(ctx); // Закрываем диалог

                        // Можно показать SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.bgSurface,
                            content: Text(
                              'Турнир отменен',
                              style: TextStyle(color: AppColors.textPrimary),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Отменить',
                        style: AppTextStyles.bodyM.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
