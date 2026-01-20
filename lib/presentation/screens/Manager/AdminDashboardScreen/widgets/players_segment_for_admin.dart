import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/bloc/admin_dashboard_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/AdminDashboardScreen/widgets/user_card_for_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PlayersSegmentForAdmin extends StatefulWidget {
  final List<TeamUserShort> users;
  final Map<String, dynamic> stats;

  const PlayersSegmentForAdmin({
    super.key,
    required this.users,
    required this.stats,
  });

  @override
  State<PlayersSegmentForAdmin> createState() => _PlayersSegmentForAdminState();
}

class _PlayersSegmentForAdminState extends State<PlayersSegmentForAdmin> {
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
          'Зарегистрировано: ${widget.stats['users']['total']}',
          style: AppTextStyles.bodyL,
        ),
        Text(
          'Участвуют в турнирах: ${widget.stats['users']['playingNow']}',
          style: AppTextStyles.bodyL,
        ),
        Text(
          'Находятся в команде: ${widget.stats['users']['inTeams']}',
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
                        const AdminDashboardQueryChanged('', 1),
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
              AdminDashboardQueryChanged(value, 1),
            );
            setState(() {});
          },
        ),

        const SizedBox(height: 16),

        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final user = widget.users[index];
              return UserCardForAdmin(user: user);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemCount: widget.users.length,
          ),
        ),
      ],
    );
  }
}
