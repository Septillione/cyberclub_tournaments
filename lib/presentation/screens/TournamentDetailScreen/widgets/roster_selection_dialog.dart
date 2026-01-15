import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RosterSelectionDialog extends StatefulWidget {
  final String teamId;
  final int requiredCount; // 2 или 5

  const RosterSelectionDialog({
    super.key,
    required this.teamId,
    required this.requiredCount,
  });

  @override
  State<RosterSelectionDialog> createState() => _RosterSelectionDialogState();
}

class _RosterSelectionDialogState extends State<RosterSelectionDialog> {
  List<TeamMemberModel> _members = [];
  final Set<String> _selectedIds = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMembers();
  }

  Future<void> _loadMembers() async {
    try {
      final team = await context.read<TeamRepository>().fetchTeamDetails(
        widget.teamId,
      );
      if (mounted) {
        setState(() {
          _members = team.members;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) Navigator.pop(context); // Закрываем при ошибке
    }
  }

  void _toggleMember(String userId) {
    setState(() {
      if (_selectedIds.contains(userId)) {
        _selectedIds.remove(userId);
      } else {
        if (_selectedIds.length < widget.requiredCount) {
          _selectedIds.add(userId);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Максимум ${widget.requiredCount} игроков")),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.bgSurface,
      title: Text(
        "Выберите состав (${_selectedIds.length}/${widget.requiredCount})",
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: 300,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _members.length,
                itemBuilder: (context, index) {
                  final member = _members[index];
                  final isSelected = _selectedIds.contains(member.userId);

                  return CheckboxListTile(
                    value: isSelected,
                    title: Text(
                      member.user.nickname,
                      style: AppTextStyles.bodyL,
                    ),
                    activeColor: AppColors.accentPrimary,
                    checkColor: Colors.white,
                    onChanged: (_) => _toggleMember(member.userId),
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
              ? () {
                  // Возвращаем список ID
                  Navigator.pop(context, _selectedIds.toList());
                }
              : null, // Кнопка неактивна, пока не выбрали нужное кол-во
          child: const Text("Подтвердить"),
        ),
      ],
    );
  }
}
