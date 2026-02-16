import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/InviteUserScreen/bloc/invite_player_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/InviteUserScreen/widgets/invite_user_card.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class InvitePlayerScreen extends StatelessWidget {
  final String teamId;

  const InvitePlayerScreen({super.key, required this.teamId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InvitePlayerBloc(teamRepository: context.read<TeamRepository>())
            ..add(InviteStarted()),
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<InvitePlayerBloc, InvitePlayerState>(
            listenWhen: (previous, current) =>
                current.successMessage != null ||
                current.errorMessage.isNotEmpty,
            listener: (context, state) {
              if (state.successMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.successMessage!),
                    backgroundColor: AppColors.greenColor,
                  ),
                );
              }
              if (state.errorMessage.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: AppColors.redColor,
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 16.0,
                right: 20.0,
              ),
              child: Column(
                children: [
                  const _InviteSearchHeader(),
                  const SizedBox(height: 24),
                  Expanded(child: _InviteResultsList(teamId: teamId)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InviteSearchHeader extends StatefulWidget {
  const _InviteSearchHeader();

  @override
  State<_InviteSearchHeader> createState() => _InviteSearchHeaderState();
}

class _InviteSearchHeaderState extends State<_InviteSearchHeader> {
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
          onChanged: (value) {
            context.read<InvitePlayerBloc>().add(
              InviteSearchQueryChanged(value),
            );
          },
        ),
      ],
    );
  }
}

class _InviteResultsList extends StatelessWidget {
  final String teamId;

  const _InviteResultsList({required this.teamId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvitePlayerBloc, InvitePlayerState>(
      builder: (context, state) {
        if (state.status == InviteStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.users.isEmpty && state.status != InviteStatus.initial) {
          return const Center(child: Text("Игроки не найдены"));
        }

        // if (state.status == InviteStatus.initial) {
        //   return const Center(
        //     child: Text("Введите имя для поиска (мин. 3 символа)"),
        //   );
        // }

        return ListView.separated(
          itemCount: state.users.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final user = state.users[index];
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
      },
    );
  }
}
