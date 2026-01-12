import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/repositories/team_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/CreateTeamScreen/bloc/create_team_bloc.dart';
import 'package:cyberclub_tournaments/presentation/widgets/avatar_picker.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
  final _descriptionController = TextEditingController();
  final _socialMediaController = TextEditingController();
  final _avatarUrlController = TextEditingController();
  final List<Discipline> _gamesList = [];

  final _formKey = GlobalKey<FormState>();

  void _onCreateTeam() {
    final name = _nameController.text.trim();
    final tag = _tagController.text.trim();
    final description = _descriptionController.text.trim();
    final socialMedia = _socialMediaController.text.trim();
    final avatarUrl = _avatarUrlController.text.trim();
    final gamesList = _gamesList.map((e) => e.name).toList();

    if (!_formKey.currentState!.validate()) return;

    if (name.isEmpty || tag.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Все поля должны быть заполнены'),
          backgroundColor: AppColors.redColor,
        ),
      );
      return;
    }

    print("SENDING AVATAR URL: $avatarUrl");

    context.read<CreateTeamBloc>().add(
      CreateTeamSubmitted(
        name: name,
        tag: tag,
        description: description,
        socialMedia: socialMedia,
        avatarUrl: avatarUrl.isNotEmpty ? avatarUrl : null,
        gamesList: gamesList,
      ),
    );
  }

  void _toggleGame(Discipline game) {
    setState(() {
      if (_gamesList.contains(game)) {
        _gamesList.remove(game);
      } else {
        _gamesList.add(game);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTeamBloc, CreateTeamState>(
      listener: (context, state) {
        if (state is CreateTeamSuccess) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Команда успешно создана!'),
              backgroundColor: AppColors.greenColor,
            ),
          );
        }
        if (state is CreateTeamFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.redColor,
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 16.0,
                right: 20.0,
              ),
              child: BlocBuilder<CreateTeamBloc, CreateTeamState>(
                builder: (context, state) {
                  if (state is CreateTeamLoading ||
                      state is CreateTeamSuccess) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            CustomBackButton(),
                            Center(
                              child: Text(
                                'Создать Команду',
                                style: AppTextStyles.h2,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              // Center(
                              //   child: Stack(
                              //     children: [
                              //       CircleAvatar(
                              //         radius: 50,
                              //         backgroundColor: AppColors.bgSurface,
                              //         backgroundImage:
                              //             _avatarUrlController.text.isNotEmpty
                              //             ? NetworkImage(
                              //                 _avatarUrlController.text,
                              //               )
                              //             : null,
                              //         child: _avatarUrlController.text.isEmpty
                              //             ? const Icon(
                              //                 LucideIcons.imagePlus,
                              //                 size: 40,
                              //                 color: AppColors.textSecondary,
                              //               )
                              //             : null,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              AvatarPicker(
                                initialUrl: null,
                                onUploadComplete: (url) {
                                  print("URL RECEIVED IN SCREEN: $url");
                                  _avatarUrlController.text = url;
                                },
                              ),

                              // const SizedBox(height: 16),

                              // TextFormField(
                              //   controller: _avatarUrlController,
                              //   decoration: const InputDecoration(
                              //     labelText: 'Ссылка на логотип (URL)',
                              //     prefixIcon: Icon(LucideIcons.link),
                              //   ),
                              //   onChanged: (value) => setState(() {}),
                              // ),
                              const SizedBox(height: 24),

                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      controller: _nameController,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                        labelText: 'Название',
                                        prefixIcon: Icon(LucideIcons.shield),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Введите название команды';
                                        }
                                        if (value.length < 3) {
                                          return 'Минимум 3 символа';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      controller: _tagController,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        labelText: 'Тег',
                                        prefixIcon: Icon(LucideIcons.tag),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Введите тег';
                                        }
                                        if (value.length < 2) {
                                          return 'Минимум 2';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 16),

                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Описание',
                                  alignLabelWithHint: true,
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(bottom: 50),
                                    child: Icon(LucideIcons.fileText),
                                  ),
                                ),
                                maxLines: 3,
                                controller: _descriptionController,
                                validator: (value) {
                                  if (value!.length > 300) {
                                    return 'Максимум 300 символов';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 16),

                              TextFormField(
                                controller: _socialMediaController,
                                decoration: InputDecoration(
                                  labelText: 'Социальные сети',
                                  prefixIcon: Icon(
                                    LucideIcons.messageCircleHeart,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.length > 50) {
                                    return 'Максимум 50 символов';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 24),

                              Text('Игры', style: AppTextStyles.h3),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: Discipline.values.map((game) {
                                  final isSelected = _gamesList.contains(game);
                                  return FilterChip(
                                    label: Text(game.title),
                                    onSelected: (_) => _toggleGame(game),
                                    selected: isSelected,
                                    backgroundColor: AppColors.bgSurface,
                                    selectedColor: AppColors.bgSurface,
                                    labelStyle: TextStyle(
                                      color: isSelected
                                          ? AppColors.accentPrimary
                                          : AppColors.textSecondary,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                    checkmarkColor: AppColors.accentPrimary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: isSelected
                                            ? AppColors.accentPrimary
                                            : Colors.transparent,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),

                              const SizedBox(height: 40),

                              GradientButton(
                                text: 'Создать команду',
                                onPressed: () => _onCreateTeam(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
