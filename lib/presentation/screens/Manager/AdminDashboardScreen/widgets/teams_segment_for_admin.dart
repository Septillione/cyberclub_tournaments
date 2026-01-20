import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/bloc/admin_dashboard_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/widgets/team_card_for_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class TeamsSegmentForAdmin extends StatefulWidget {
  final List<TeamModel> teams;
  final Map<String, dynamic> stats;

  const TeamsSegmentForAdmin({
    super.key,
    required this.teams,
    required this.stats,
  });

  @override
  State<TeamsSegmentForAdmin> createState() => _PlayersSegmentForAdminState();
}

class _PlayersSegmentForAdminState extends State<TeamsSegmentForAdmin> {
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

        Text('Статистика игроков', style: AppTextStyles.bodyL),

        const SizedBox(height: 16),

        Text(
          'Зарегистрировано: ${widget.stats['teams']['total']}',
          style: AppTextStyles.bodyL,
        ),
        Text(
          'Участвуют в турнирах: ${widget.stats['teams']['active']}',
          style: AppTextStyles.bodyL,
        ),
        Text(
          'Находятся в команде: ${widget.stats['teams']['joinRequests']}',
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
                        const AdminDashboardQueryChanged('', 2),
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
              AdminDashboardQueryChanged(value, 2),
            );
            setState(() {});
          },
        ),

        const SizedBox(height: 16),

        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final team = widget.teams[index];
              return TeamCardForAdmin(team: team);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: widget.teams.length,
          ),
        ),
      ],
    );
  }
}
