import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/bloc/admin_dashboard_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/widgets/bun_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class UserCardForAdmin extends StatelessWidget {
  final TeamUserShort user;

  const UserCardForAdmin({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.bgMain,
              backgroundImage: user.avatarUrl != null
                  ? NetworkImage(user.avatarUrl!)
                  : null,
              child: user.avatarUrl == null
                  ? Icon(
                      LucideIcons.userRound,
                      color: AppColors.textSecondary,
                      size: 20,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(user.nickname, style: AppTextStyles.h3),
            const Spacer(),
            PopupMenuButton<String>(
              elevation: 4,
              color: AppColors.bgSurface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: AppColors.bgMain, width: 1),
              ),
              offset: const Offset(0, 50),
              icon: const Icon(LucideIcons.ellipsisVertical, size: 24),
              onSelected: (value) {
                if (value == 'ban') {
                  _showBanDialog(context, user.isBanned);
                } else if (value == 'change_role') {
                  _showRoleDialog(context, user);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'change_role',
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.pen,
                        size: 20,
                        color: AppColors.redColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Изменить роль',
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'ban',
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.ban,
                        size: 20,
                        color: AppColors.redColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Забанить',
                        style: AppTextStyles.bodyM.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showRoleDialog(BuildContext context, TeamUserShort user) {
    showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Выберите роль'),
        children: ['USER', 'MANAGER', 'ADMIN'].map((role) {
          return SimpleDialogOption(
            onPressed: () {
              context.read<AdminDashboardBloc>().add(
                AdminChangeUserRole(user.id, role),
              );
              Navigator.pop(ctx);
            },
            child: Text(role),
          );
        }).toList(),
      ),
    );
  }

  // Внутри UserCardForAdmin

  void _showBanDialog(BuildContext context, bool isBanned) {
    final bloc = context.read<AdminDashboardBloc>();

    if (isBanned) {
      // --- ДИАЛОГ РАЗБАНА (Простой) ---
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.bgSurface,
          title: Text('Разбанить ${user.nickname}?'),
          content: const Text('Пользователь снова сможет входить в систему.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenColor,
              ),
              onPressed: () {
                // Отправляем эвент разбана (вам нужно добавить его в Bloc)
                bloc.add(AdminUnbanUser(user.id));
                Navigator.pop(context);
              },
              child: const Text('Разбанить'),
            ),
          ],
        ),
      );
    } else {
      // --- ДИАЛОГ БАНА (Сложный, с выбором) ---
      showDialog(
        context: context,
        builder: (context) => BanSetupDialog(
          userName: user.nickname,
          onConfirm: (reason, days) {
            // Отправляем эвент бана
            bloc.add(
              AdminToggleBanUser(userId: user.id, reason: reason, days: days),
            );
          },
        ),
      );
    }
  }

  // void _showBanDialog(BuildContext context, bool isBanned) {
  //   final bloc = context.read<AdminDashboardBloc>();

  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadiusGeometry.circular(16),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text(
  //                 isBanned
  //                     ? 'Вы уверены что хотите разбанить ${user.nickname}?'
  //                     : 'Вы уверены что хотите забанить ${user.nickname}?',
  //                 style: AppTextStyles.h3,
  //                 textAlign: TextAlign.center,
  //               ),
  //               const SizedBox(height: 24),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Expanded(
  //                     child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(
  //                         backgroundColor: isBanned
  //                             ? AppColors.greenColor
  //                             : AppColors.redColor,
  //                       ),
  //                       onPressed: () {
  //                         // bloc.add(AdminToggleBanUser(user.id));
  //                         bloc.add(
  //                           AdminToggleBanUser(user.id, 'TY ZABANIN', 3),
  //                         );
  //                         context.pop();
  //                       },
  //                       child: Text(isBanned ? 'Разбанить' : 'Забанить'),
  //                     ),
  //                   ),
  //                   const SizedBox(width: 16),
  //                   Expanded(
  //                     child: OutlinedButton(
  //                       onPressed: () => context.pop(),
  //                       child: Text('Отклонить'),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
