import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/bloc/admin_dashboard_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/CreateTournamentScreen/bloc/create_tournament_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/tournament_card.dart';
import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TournamentsSegmentForAdmin extends StatefulWidget {
  final List<TournamentModel> tournaments;
  final Map<String, dynamic> stats;

  const TournamentsSegmentForAdmin({
    super.key,
    required this.tournaments,
    required this.stats,
  });

  @override
  State<TournamentsSegmentForAdmin> createState() =>
      _TournamentsSegmentForAdminState();
}

class _TournamentsSegmentForAdminState
    extends State<TournamentsSegmentForAdmin> {
  // List<TournamentModel> _tournaments = [];
  // bool _isLoading = false;
  // Timer? _debounce;

  // void _onSearchChanged(String query) {
  //   if (_debounce?.isActive ?? false) _debounce!.cancel();
  //   _debounce = Timer(const Duration(milliseconds: 500), () {
  //     if (query.length >= 3) {
  //       _performSearch(query);
  //     } else {
  //       setState(() {
  //         _tournaments = [];
  //       });
  //     }
  //   });
  // }

  // Future<void> _performSearch(String query) async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   final tournaments = await context.read<AdminDashboardBloc>()..add(
  //     AdminDashboardQueryChanged(query),
  //   );
  //   if (mounted) {
  //     setState(() {
  //       _tournaments = tournaments;
  //       _isLoading = false;
  //     });
  //   }
  // }

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        Text('Статистика турниров', style: AppTextStyles.bodyL),

        const SizedBox(height: 16),

        Text(
          'Всего: ${widget.stats['tournaments']['total']}',
          style: AppTextStyles.bodyL,
        ),
        Text(
          'Сейчас идут: ${widget.stats['tournaments']['live']}',
          style: AppTextStyles.bodyL,
        ),
        Text(
          'Набор открыт: ${widget.stats['tournaments']['open']}',
          style: AppTextStyles.bodyL,
        ),

        const SizedBox(height: 24),

        TextFormField(
          controller: _searchController,
          focusNode: _focusNode,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Поиск',
            suffixIcon: _isSearching == true
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      _focusNode.unfocus();
                      setState(() {
                        _isSearching = false;
                      });
                      context.read<AdminDashboardBloc>().add(
                        const AdminDashboardQueryChanged('', 0),
                      );
                    },
                  )
                : Icon(LucideIcons.search),
          ),
          onTap: () {
            setState(() {
              _isSearching = true;
            });
          },
          onChanged: (value) {
            context.read<AdminDashboardBloc>().add(
              AdminDashboardQueryChanged(value, 0),
            );
            setState(() {});
          },
        ),

        const SizedBox(height: 16),

        Expanded(
          child: Scaffold(
            floatingActionButton: _buildCreateTournamentButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: ListView.separated(
              itemBuilder: (context, index) {
                final t = widget.tournaments[index];
                return TournamentCard(
                  tournament: t,
                  isManager: true,
                  onCancelTournament: (id) {
                    context.read<CreateTournamentBloc>().add(
                      CancelTournamentSubmitted(touranmentId: t.id),
                    );
                  },
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: widget.tournaments.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateTournamentButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: GradientButton(
        text: 'Создать турнир',
        onPressed: () => context.push('/create-tournament'),
      ),
    );
  }
}
