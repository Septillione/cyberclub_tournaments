// import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
// import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
// import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
// import 'package:cyberclub_tournaments/presentation/screens/UserTeamsScreen/bloc/user_teams_bloc.dart';
// import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';

// class TeamCardForAdmin extends StatelessWidget {
//   final TeamModel team;

//   const TeamCardForAdmin({super.key, required this.team});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24.0),
//         color: AppColors.bgSurface,
//       ),
//       child: InkWell(
//         onTap: () => context.push('/my-teams/${team.id}'),
//         borderRadius: BorderRadius.circular(24.0),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 20,
//                     backgroundColor: AppColors.bgMain,
//                     backgroundImage: team.avatarUrl != null
//                         ? NetworkImage(team.avatarUrl!)
//                         : null,
//                     child: team.avatarUrl == null
//                         ? Icon(
//                             LucideIcons.shield,
//                             color: AppColors.textSecondary,
//                             size: 20,
//                           )
//                         : null,
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     '${team.name} [${team.tag}]',
//                     style: AppTextStyles.h3.copyWith(fontSize: 18),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TeamCardForAdmin extends StatelessWidget {
  final TeamModel team;

  const TeamCardForAdmin({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/my-teams/${team.id}'),
      borderRadius: BorderRadius.circular(24.0),
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
              backgroundImage: team.avatarUrl != null
                  ? NetworkImage(team.avatarUrl!)
                  : null,
              child: team.avatarUrl == null
                  ? Icon(
                      LucideIcons.userRound,
                      color: AppColors.textSecondary,
                      size: 20,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text('${team.name} [${team.tag}]', style: AppTextStyles.h3),
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
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.fireExtinguisher,
                        size: 20,
                        color: AppColors.redColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Редактировать',
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
                        LucideIcons.fireExtinguisher,
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
}
