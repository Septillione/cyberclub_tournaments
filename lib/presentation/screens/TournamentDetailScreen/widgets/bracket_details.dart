import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/bloc/tournament_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tournament_bracket/flutter_tournament_bracket.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BracketDetails extends StatelessWidget {
  const BracketDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TournamentDetailBloc, TournamentDetailState>(
      builder: (context, state) {
        if (state is! TournamentDetailLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        final rounds = state.bracketRounds;

        if (rounds.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  Icon(
                    LucideIcons.network,
                    size: 64,
                    color: AppColors.textDisabled.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Сетка еще не сформирована',
                    style: AppTextStyles.h3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Организатор запустит турнир, когда наберется достаточное количество участников.',
                    style: AppTextStyles.bodyM,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        final int firstRoundCount = rounds.isNotEmpty
            ? (rounds.first.matches?.length ?? 0)
            : 0;

        final double calculatedHeight = (firstRoundCount * 150.0).clamp(
          200.0,
          2000.0,
        );

        return SizedBox(
          height: calculatedHeight,
          child: InteractiveViewer(
            constrained: false,
            boundaryMargin: const EdgeInsets.all(100),
            minScale: 0.1,
            maxScale: 3.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TournamentBracket(
                list: rounds,
                lineColor: AppColors.accentPrimary,
                cardWidth: 190,
                cardHeight: 90,
                card: (TournamentMatch item) => _buildMatchCard(item),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMatchCard(TournamentMatch match) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.bgMain, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTeamRow(match.teamA, match.scoreTeamA),
          const Divider(height: 1, thickness: 1, color: AppColors.bgMain),
          _buildTeamRow(match.teamB, match.scoreTeamB),
        ],
      ),
    );
  }

  Widget _buildTeamRow(String? name, String? score) {
    final bool isPlaceholder = name == null || name == "TBD";
    final displayName = isPlaceholder ? "Ожидание..." : name!;
    final displayScore = score ?? "0";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              displayName,
              style: AppTextStyles.bodyM.copyWith(
                color: isPlaceholder
                    ? AppColors.textDisabled
                    : AppColors.textPrimary,
                fontWeight: isPlaceholder ? FontWeight.normal : FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.bgMain,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              displayScore,
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class BracketDetails extends StatelessWidget {
//   const BracketDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TournamentDetailBloc, TournamentDetailState>(
//       builder: (context, state) {
//         if (state is! TournamentDetailLoaded) {
//           return const SizedBox.shrink();
//         }

//         final matches = state.bracketRounds;

//         if (matches.isEmpty) {
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.all(32.0),
//               child: Column(
//                 children: [
//                   const Icon(
//                     Icons.grid_off,
//                     size: 48,
//                     color: AppColors.textDisabled,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Сетка пока не сформирована.\nНужно минимум 2 участника.',
//                     textAlign: TextAlign.center,
//                     style: AppTextStyles.bodyM,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }

//         return SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TournamentBracket(
//                 list: matches,
//                 cardWidth: 150,
//                 cardHeight: 80,
//                 lineColor: AppColors.accentPrimary,
//                 card: (match) => customMatchCard(match),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // Widget _buildMatchCard(TournamentMatch match) {
//   //   return
//   // }

//   Widget customMatchCard(TournamentMatch item) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                   item.teamA ?? "No Info",
//                   style: const TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   item.teamB ?? "No Info",
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                   style: const TextStyle(fontSize: 16, color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//           const VerticalDivider(color: Colors.black),
//           const SizedBox(width: 5),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 item.scoreTeamA ?? "",
//                 style: const TextStyle(fontSize: 16, color: Colors.black),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 item.scoreTeamB ?? "",
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(width: 5),
//         ],
//       ),
//     );
//   }
// }
