import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/CreateTeamScreen/bloc/create_team_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateTeamScreen extends StatelessWidget {
  const CreateTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreateTeamBloc(teamRepository: context.read<TeamRepository>()),
      child: const _CreateTeamView(),
    );
  }
}

class _CreateTeamView extends StatefulWidget {
  const _CreateTeamView();

  @override
  State<_CreateTeamView> createState() => _CreateTeamViewState();
}

class _CreateTeamViewState extends State<_CreateTeamView> {
  final _nameController = TextEditingController();
  final _tagController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _onCreateTeam() {
    final name = _nameController.text.trim();
    final tag = _tagController.text.trim();

    if (!_formKey.currentState!.validate()) return;

    if (name.isEmpty || tag.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Все поля должны быть заполнены'),
          backgroundColor: AppColors.statusError,
        ),
      );
      return;
    }

    context.read<CreateTeamBloc>().add(
      CreateTeamSubmitted(name: name, tag: tag),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTeamBloc, CreateTeamState>(
      listener: (context, state) {
        if (state is CreateTeamSuccess) {
          context.pop();
        }
        if (state is CreateTeamFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.statusError,
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
            child: BlocBuilder<CreateTeamBloc, CreateTeamState>(
              builder: (context, state) {
                if (state is CreateTeamLoading || state is CreateTeamSuccess) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Создать Команду',
                        style: AppTextStyles.h1,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Название команды',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите название команды';
                          }
                          if (value.length < 3) return 'Минимум 3 символа';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _tagController,
                        decoration: InputDecoration(labelText: 'Тег команды'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите тег команды';
                          }
                          if (value.length < 2) return 'Минимум 2 символа';
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () => _onCreateTeam(),
                        child: const Text('Создать команду'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
