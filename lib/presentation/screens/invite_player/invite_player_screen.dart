import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/presentation/screens/invite_player/bloc/invite_player_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/invite_player/widgets/invite_user_card.dart';

class InvitePlayerScreen extends StatelessWidget {
  final String teamId;

  const InvitePlayerScreen({super.key, required this.teamId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<InvitePlayerBloc>()..add(InviteStarted()),
      child: _InvitePlayerView(teamId: teamId),
    );
  }
}

class _InvitePlayerView extends StatelessWidget {
  final String teamId;

  const _InvitePlayerView({required this.teamId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: SafeArea(
        child: BlocListener<InvitePlayerBloc, InvitePlayerState>(
          listenWhen: _shouldListen,
          listener: _handleState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                const _SearchHeader(),
                const SizedBox(height: 24),
                Expanded(child: _ResultsList(teamId: teamId)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _shouldListen(InvitePlayerState prev, InvitePlayerState curr) {
    return curr.successMessage != null || curr.errorMessage != null;
  }

  void _handleState(BuildContext context, InvitePlayerState state) {
    if (state.successMessage != null) {
      _showSnackBar(context, state.successMessage!, AppColors.greenColor);
    }
    if (state.errorMessage != null) {
      _showSnackBar(context, state.errorMessage!, AppColors.redColor);
    }
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }
}

class _SearchHeader extends StatefulWidget {
  const _SearchHeader();

  @override
  State<_SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<_SearchHeader> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomBackButton(),
        const SizedBox(height: 16),
        Text('Пригласить игрока', style: AppTextStyles.h2),
        const SizedBox(height: 24),
        TextFormField(
          controller: _controller,
          textInputAction: TextInputAction.search,
          decoration: const InputDecoration(
            labelText: 'Никнейм игрока...',
            prefixIcon: Icon(LucideIcons.search),
          ),
          onChanged: (query) {
            context.read<InvitePlayerBloc>().add(
              InviteSearchQueryChanged(query),
            );
          },
        ),
      ],
    );
  }
}

class _ResultsList extends StatelessWidget {
  final String teamId;

  const _ResultsList({required this.teamId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvitePlayerBloc, InvitePlayerState>(
      builder: (context, state) {
        return switch (state.status) {
          InviteStatus.initial => const _EmptyState(
            message: 'Введите имя для поиска',
          ),
          InviteStatus.loading => const Center(
            child: CircularProgressIndicator(),
          ),
          InviteStatus.failure => const _EmptyState(message: 'Ошибка загрузки'),
          InviteStatus.success =>
            state.users.isEmpty
                ? const _EmptyState(message: 'Игроки не найдены')
                : _UsersList(teamId: teamId, users: state.users),
        };
      },
    );
  }
}

class _UsersList extends StatelessWidget {
  final String teamId;
  final List users;

  const _UsersList({required this.teamId, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final user = users[index];
        return InviteUserCard(
          user: user,
          onInvite: () {
            context.read<InvitePlayerBloc>().add(
              InviteUserClicked(teamId: teamId, userId: user.id),
            );
          },
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;

  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppTextStyles.bodyL.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}
