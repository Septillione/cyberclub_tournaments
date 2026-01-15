import 'dart:async';

import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class InvitePlayerScreen extends StatefulWidget {
  final String teamId;
  const InvitePlayerScreen({super.key, required this.teamId});

  @override
  State<InvitePlayerScreen> createState() => _InvitePlayerScreenState();
}

class _InvitePlayerScreenState extends State<InvitePlayerScreen> {
  final _searchController = TextEditingController();
  List<TeamUserShort> _users = [];
  bool _isLoading = false;
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.length >= 3) {
        _performSearch(query);
      } else {
        setState(() {
          _users = [];
        });
      }
    });
  }

  Future<void> _performSearch(String query) async {
    setState(() {
      _isLoading = true;
    });
    final users = await context.read<TeamRepository>().searchUser(query);
    if (mounted) {
      setState(() {
        _users = users;
        _isLoading = false;
      });
    }
  }

  Future<void> _inviteUser(String userId) async {
    try {
      await context.read<TeamRepository>().inviteUserToTeam(
        widget.teamId,
        userId,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Приглашение отправлено!'),
            backgroundColor: AppColors.greenColor,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка отправки'),
            backgroundColor: AppColors.redColor,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              const SizedBox(height: 16),
              Text('Пригласить игрока', style: AppTextStyles.h2),
              const SizedBox(height: 24),

              TextFormField(
                controller: _searchController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Никнейм игрока...',
                  prefixIcon: Icon(LucideIcons.search),
                ),
                onChanged: _onSearchChanged,
              ),

              const SizedBox(height: 24),

              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else if (_users.isEmpty && _searchController.text.length >= 3)
                const Center(child: Text("Игроки не найдены"))
              else
                Expanded(
                  child: ListView.separated(
                    itemCount: _users.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final user = _users[index];

                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.bgSurface,
                          borderRadius: BorderRadius.circular(12),
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

                            Expanded(
                              child: Text(
                                user.nickname,
                                style: AppTextStyles.h3,
                              ),
                            ),

                            SizedBox(
                              width: 130,
                              height: 40,
                              child: GradientButton(
                                text: 'Пригласить',
                                onPressed: () => _inviteUser(user.id),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
