import 'package:cyberclub_tournaments/domain/usecases/team/fetch_team_details_usecase.dart';
import 'package:flutter/material.dart';
import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';

class RosterSelectionDialog extends StatefulWidget {
  final String teamId;
  final int requiredCount;

  const RosterSelectionDialog({
    super.key,
    required this.teamId,
    required this.requiredCount,
  });

  @override
  State<RosterSelectionDialog> createState() => _RosterSelectionDialogState();
}

class _RosterSelectionDialogState extends State<RosterSelectionDialog> {
  final Set<String> _selectedIds = {};
  List<TeamMember>? _members;

  @override
  void initState() {
    super.initState();
    _loadMembers();
  }

  Future<void> _loadMembers() async {
    try {
      final team = await serviceLocator<FetchTeamDetailsUsecase>()(
        widget.teamId,
      );
      if (mounted) setState(() => _members = team.members);
    } catch (_) {
      if (mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_members == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return AlertDialog(
      backgroundColor: AppColors.bgSurface,
      title: Text("Состав (${_selectedIds.length}/${widget.requiredCount})"),
      content: SizedBox(
        width: double.maxFinite,
        height: 300,
        child: ListView.builder(
          itemCount: _members!.length,
          itemBuilder: (context, index) {
            final member = _members![index];
            return CheckboxListTile(
              value: _selectedIds.contains(member.userId),
              title: Text(member.user.nickname),
              onChanged: (_) => setState(() {
                if (_selectedIds.contains(member.userId)) {
                  _selectedIds.remove(member.userId);
                } else if (_selectedIds.length < widget.requiredCount) {
                  _selectedIds.add(member.userId);
                }
              }),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Отмена"),
        ),
        ElevatedButton(
          onPressed: _selectedIds.length == widget.requiredCount
              ? () => Navigator.pop(context, _selectedIds.toList())
              : null,
          child: const Text("Подтвердить"),
        ),
      ],
    );
  }
}
