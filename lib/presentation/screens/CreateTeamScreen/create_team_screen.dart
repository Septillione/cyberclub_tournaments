import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/CreateTeamScreen/bloc/create_team_bloc.dart';
import 'package:cyberclub_tournaments/presentation/widgets/avatar_picker.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

  void _initFormData() {
    final team = widget.teamToEdit;
    if (team == null) return;

    _nameController.text = team.name;
    _tagController.text = team.tag;
    _descriptionController.text = team.description ?? '';
    _socialMediaController.text = team.socialMedia ?? '';
    _avatarUrl = team.avatarUrl;
    _selectedGames = _parseGames(team.gamesList);
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

  @override
  void dispose() {
    _nameController.dispose();
    _tagController.dispose();
    _descriptionController.dispose();
    _socialMediaController.dispose();
    super.dispose();
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
                  return _buildForm();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          const SizedBox(height: 16),
          _Header(isEditing: _isEditing),
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              children: [
                AvatarPicker(
                  initialUrl: _avatarUrl,
                  onUploadComplete: _onAvatarUploaded,
                ),
                const SizedBox(height: 24),
                TeamFormFields(
                  nameController: _nameController,
                  tagController: _tagController,
                  descriptionController: _descriptionController,
                  socialMediaController: _socialMediaController,
                ),
                const SizedBox(height: 24),
                GamesSelector(
                  selectedGames: _selectedGames,
                  onGameToggled: _onGameToggled,
                ),
                const SizedBox(height: 40),
                GradientButton(
                  text: _isEditing ? 'Сохранить изменения' : 'Создать команду',
                  onPressed: _onSubmit,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleState(BuildContext context, CreateTeamState state) {
    if (state is CreateTeamSuccess) {
      context.go('/my-teams');
      _showSuccess(state.isEditing);
    }
    if (state is CreateTeamFailure) {
      _showError(state.errorMessage);
    }
  }

  void _showSuccess(bool isEditing) {
    final message = isEditing
        ? 'Команда успешно обновлена!'
        : 'Команда успешно создана!';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.greenColor),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.redColor),
    );
  }
}

class _Header extends StatelessWidget {
  final bool isEditing;

  const _Header({required this.isEditing});

  @override
  Widget build(BuildContext context) {
    return Text(
      isEditing ? 'Редактировать команду' : 'Создать команду',
      style: AppTextStyles.h2,
    );
  }
}
