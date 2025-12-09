// import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
// import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
// import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
// import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:intl/intl.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';

// class TeamTournamentCard extends StatelessWidget {
//   final TournamentModel tournament;
//   final TeamModel team;

//   const TeamTournamentCard({
//     super.key,
//     required this.tournament,
//     required this.team,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final formattedDate = DateFormat(
//       'd MMMM, HH:mm',
//       'ru_RU',
//     ).format(tournament.startDate);

//     final participatingTeammates = team.members
//         .where(
//           (teammate) => tournament.registeredPlayerIds.contains(teammate.id),
//         )
//         .toList();

//     return InkWell(
//       onTap: () => context.push('/tournaments/${tournament.id}'),
//       borderRadius: BorderRadius.circular(16.0),
//       child: Container(
//         padding: EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: AppColors.bgSurface,
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(tournament.title, style: AppTextStyles.h3),
//             const SizedBox(height: 8),

//             Text('Начало: $formattedDate', style: AppTextStyles.bodyM),
//             const SizedBox(height: 16),

//             const Divider(color: AppColors.bgMain, height: 1),
//             const SizedBox(height: 16),

//             Text('Участвуют от вашей команды:', style: AppTextStyles.bodyM),
//             const SizedBox(height: 12),

//             Wrap(
//               spacing: 12.0,
//               runSpacing: 8.0,
//               children: participatingTeammates.map((teammate) {
//                 return Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     color: AppColors.bgMain,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       CircleAvatar(
//                         radius: 12,
//                         backgroundColor: AppColors.bgSurface,
//                         backgroundImage: NetworkImage(teammate.avatarUrl),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         teammate.name,
//                         style: AppTextStyles.bodyM.copyWith(
//                           color: AppColors.textPrimary,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: const Icon(
//                 LucideIcons.arrowRight,
//                 color: AppColors.textPrimary,
//                 size: 24,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
