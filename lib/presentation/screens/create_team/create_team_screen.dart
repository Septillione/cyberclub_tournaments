import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/avatar_picker.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_team/bloc/create_team_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_team/widgets/team_form_fields.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_team/widgets/games_selector.dart';

class CreateTeamScreen extends StatelessWidget {
  final TeamEntity? teamToEdit;

  const CreateTeamScreen({super.key, this.teamToEdit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<CreateTeamBloc>(),
      child: _CreateTeamView(teamToEdit: teamToEdit),
    );
  }
}

class _CreateTeamView extends StatefulWidget {
  final TeamEntity? teamToEdit;

  const _CreateTeamView({this.teamToEdit});

  @override
  State<_CreateTeamView> createState() => _CreateTeamViewState();
}

class _CreateTeamViewState extends State<_CreateTeamView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _tagController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _socialMediaController = TextEditingController();

  String? _avatarUrl;
  List<Discipline> _selectedGames = [];

  bool get _isEditing => widget.teamToEdit != null;

  @override
  void initState() {
    super.initState();
    _initFormData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _tagController.dispose();
    _descriptionController.dispose();
    _socialMediaController.dispose();
    super.dispose();
  }

  void _initFormData() {
    final team = widget.teamToEdit;
    if (team == null) return;

    _nameController.text = team.name;
    _tagController.text = team.tag;
    _descriptionController.text = team.description ?? '';
    _socialMediaController.text = team.socialMedia ?? '';
    _avatarUrl = team.avatarUrl;
    _selectedGames = _parseGames(team.gamesList!);
  }

  List<Discipline> _parseGames(List<String> gameNames) {
    return gameNames
        .map((name) {
          try {
            return Discipline.values.firstWhere((d) => d.name == name);
          } catch (_) {
            return null;
          }
        })
        .whereType<Discipline>()
        .toList();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final gamesList = _selectedGames.map((g) => g.name).toList();

    if (_isEditing) {
      context.read<CreateTeamBloc>().add(
        UpdateTeamSubmitted(
          teamId: widget.teamToEdit!.id,
          name: _nameController.text.trim(),
          tag: _tagController.text.trim(),
          description: _descriptionController.text.trim(),
          socialMedia: _socialMediaController.text.trim(),
          avatarUrl: _avatarUrl,
          gamesList: gamesList,
        ),
      );
    } else {
      context.read<CreateTeamBloc>().add(
        CreateTeamSubmitted(
          name: _nameController.text.trim(),
          tag: _tagController.text.trim(),
          description: _descriptionController.text.trim(),
          socialMedia: _socialMediaController.text.trim(),
          avatarUrl: _avatarUrl,
          gamesList: gamesList,
        ),
      );
    }
  }

  void _onGameToggled(Discipline game) {
    setState(() {
      if (_selectedGames.contains(game)) {
        _selectedGames.remove(game);
      } else {
        _selectedGames.add(game);
      }
    });
  }

  void _onAvatarUploaded(String url) {
    _avatarUrl = url;
  }

  void _handleState(BuildContext context, CreateTeamState state) {
    if (state is CreateTeamSuccess) {
      context.go('/my-teams');
      _showSnackBar(
        state.isEditing
            ? 'Команда успешно обновлена!'
            : 'Команда успешно создана!',
        AppColors.greenColor,
      );
    }
    if (state is CreateTeamFailure) {
      _showSnackBar(state.errorMessage, AppColors.redColor);
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTeamBloc, CreateTeamState>(
      listener: _handleState,
      child: Scaffold(
        backgroundColor: AppColors.bgMain,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: BlocBuilder<CreateTeamBloc, CreateTeamState>(
                builder: (context, state) {
                  if (state is CreateTeamLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return _buildContent();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(isEditing: _isEditing),
          const SizedBox(height: 32),
          Expanded(
            child: _FormBody(
              avatarUrl: _avatarUrl,
              nameController: _nameController,
              tagController: _tagController,
              descriptionController: _descriptionController,
              socialMediaController: _socialMediaController,
              selectedGames: _selectedGames,
              isEditing: _isEditing,
              onAvatarUploaded: _onAvatarUploaded,
              onGameToggled: _onGameToggled,
              onSubmit: _onSubmit,
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final bool isEditing;

  const _Header({required this.isEditing});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomBackButton(),
        const SizedBox(height: 16),
        Text(
          isEditing ? 'Редактировать команду' : 'Создать команду',
          style: AppTextStyles.h2,
        ),
      ],
    );
  }
}

class _FormBody extends StatelessWidget {
  final String? avatarUrl;
  final TextEditingController nameController;
  final TextEditingController tagController;
  final TextEditingController descriptionController;
  final TextEditingController socialMediaController;
  final List<Discipline> selectedGames;
  final bool isEditing;
  final ValueChanged<String> onAvatarUploaded;
  final ValueChanged<Discipline> onGameToggled;
  final VoidCallback onSubmit;

  const _FormBody({
    required this.avatarUrl,
    required this.nameController,
    required this.tagController,
    required this.descriptionController,
    required this.socialMediaController,
    required this.selectedGames,
    required this.isEditing,
    required this.onAvatarUploaded,
    required this.onGameToggled,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AvatarPicker(initialUrl: avatarUrl, onUploadComplete: onAvatarUploaded),
        const SizedBox(height: 24),
        TeamFormFields(
          nameController: nameController,
          tagController: tagController,
          descriptionController: descriptionController,
          socialMediaController: socialMediaController,
        ),
        const SizedBox(height: 24),
        GamesSelector(
          selectedGames: selectedGames,
          onGameToggled: onGameToggled,
        ),
        const SizedBox(height: 40),
        GradientButton(
          text: isEditing ? 'Сохранить изменения' : 'Создать команду',
          onPressed: onSubmit,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
