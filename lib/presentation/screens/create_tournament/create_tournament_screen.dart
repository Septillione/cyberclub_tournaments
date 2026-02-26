import 'package:cyberclub_tournaments/core/di/injection_container.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgetsnew/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_tournament/bloc/create_tournament_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_tournament/widgets/tournament_basic_fields.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_tournament/widgets/tournament_format_fields.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_tournament/widgets/tournament_schedule_fields.dart';
import 'package:cyberclub_tournaments/presentation/screens/create_tournament/widgets/prizes_section.dart';

class CreateTournamentScreen extends StatelessWidget {
  final TournamentEntity? tournamentToEdit;

  const CreateTournamentScreen({super.key, this.tournamentToEdit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<CreateTournamentBloc>(),
      child: _CreateTournamentView(tournamentToEdit: tournamentToEdit),
    );
  }
}

class _CreateTournamentView extends StatefulWidget {
  final TournamentEntity? tournamentToEdit;

  const _CreateTournamentView({this.tournamentToEdit});

  @override
  State<_CreateTournamentView> createState() => _CreateTournamentViewState();
}

class _CreateTournamentViewState extends State<_CreateTournamentView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _rulesController = TextEditingController();
  final _addressController = TextEditingController();

  Discipline _discipline = Discipline.dota2;
  BracketType _bracketType = BracketType.singleElimination;
  TeamMode _teamMode = TeamMode.team5v5;
  int _maxParticipants = 16;
  bool _isOnline = true;
  String _imageUrl = '';

  DateTime _startDate = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _startTime = const TimeOfDay(hour: 18, minute: 0);

  List<PrizeInput> _prizes = [
    PrizeInput(label: '1 место', amount: ''),
    PrizeInput(label: '2 место', amount: ''),
    PrizeInput(label: '3 место', amount: ''),
  ];

  bool get _isEditing => widget.tournamentToEdit != null;

  @override
  void initState() {
    super.initState();
    _initFormData();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _rulesController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _initFormData() {
    final t = widget.tournamentToEdit;
    if (t == null) return;

    _titleController.text = t.title;
    _descriptionController.text = t.description;
    _rulesController.text = t.rules;
    _addressController.text = t.address ?? '';
    _imageUrl = t.imageUrl;
    _isOnline = t.isOnline;
    _discipline = t.discipline;
    _teamMode = t.teamMode;
    _maxParticipants = t.participants.max;
    _bracketType = t.bracketType;
    _startDate = t.startDate;
    _startTime = TimeOfDay.fromDateTime(t.startDate);
    _prizes = t.prizes
        .map((p) => PrizeInput(label: p.label, amount: p.amount))
        .toList();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) setState(() => _startDate = date);
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (time != null) setState(() => _startTime = time);
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final fullDate = DateTime(
      _startDate.year,
      _startDate.month,
      _startDate.day,
      _startTime.hour,
      _startTime.minute,
    );

    final prizes = _prizes
        .where((p) => p.amount.isNotEmpty)
        .map((p) => PrizeItem(label: p.label, amount: p.amount))
        .toList();

    if (_isEditing) {
      context.read<CreateTournamentBloc>().add(
        UpdateTournamentSubmitted(
          id: widget.tournamentToEdit!.id,
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          rules: _rulesController.text.trim(),
          discipline: _discipline,
          startDate: fullDate,
          maxParticipants: _maxParticipants,
          bracketType: _bracketType,
          teamMode: _teamMode,
          imageUrl: _imageUrl,
          isOnline: _isOnline,
          address: _addressController.text.trim(),
          prizes: prizes,
        ),
      );
    } else {
      context.read<CreateTournamentBloc>().add(
        CreateTournamentSubmitted(
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          rules: _rulesController.text.trim(),
          discipline: _discipline,
          startDate: fullDate,
          maxParticipants: _maxParticipants,
          bracketType: _bracketType,
          teamMode: _teamMode,
          imageUrl: _imageUrl,
          isOnline: _isOnline,
          address: _addressController.text.trim(),
          prizes: prizes,
        ),
      );
    }
  }

  void _addPrize() {
    setState(() {
      _prizes.add(PrizeInput(label: '${_prizes.length + 1} место', amount: ''));
    });
  }

  void _removePrize(int index) {
    setState(() {
      _prizes.removeAt(index);
      for (int i = 0; i < _prizes.length; i++) {
        _prizes[i].label = '${i + 1} место';
      }
    });
  }

  void _handleState(BuildContext context, CreateTournamentState state) {
    if (state is CreateTournamentSuccess) {
      context.pop();
    }
    if (state is CreateTournamentFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: AppColors.redColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTournamentBloc, CreateTournamentState>(
      listener: _handleState,
      child: Scaffold(
        backgroundColor: AppColors.bgMain,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: BlocBuilder<CreateTournamentBloc, CreateTournamentState>(
              builder: (context, state) {
                if (state is CreateTournamentLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return _buildForm();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Header(isEditing: _isEditing),
            const SizedBox(height: 16),
            TournamentBasicFields(
              titleController: _titleController,
              descriptionController: _descriptionController,
              rulesController: _rulesController,
            ),
            const SizedBox(height: 32),
            TournamentFormatFields(
              discipline: _discipline,
              teamMode: _teamMode,
              bracketType: _bracketType,
              maxParticipants: _maxParticipants,
              onDisciplineChanged: (v) => setState(() => _discipline = v),
              onTeamModeChanged: (v) => setState(() => _teamMode = v),
              onBracketTypeChanged: (v) => setState(() => _bracketType = v),
              onMaxParticipantsChanged: (v) =>
                  setState(() => _maxParticipants = v),
            ),
            const SizedBox(height: 32),
            TournamentScheduleFields(
              startDate: _startDate,
              startTime: _startTime,
              isOnline: _isOnline,
              addressController: _addressController,
              onPickDate: _pickDate,
              onPickTime: _pickTime,
              onOnlineChanged: (v) => setState(() => _isOnline = v),
            ),
            const SizedBox(height: 16),
            PrizesSection(
              prizes: _prizes,
              onAdd: _addPrize,
              onRemove: _removePrize,
            ),
            const SizedBox(height: 32),
            GradientButton(
              text: _isEditing ? 'Сохранить изменения' : 'Создать турнир',
              onPressed: _onSubmit,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final bool isEditing;

  const _Header({required this.isEditing});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomBackButton(),
        Text(
          isEditing ? 'Редактировать турнир' : 'Создать турнир',
          style: AppTextStyles.h3,
        ),
      ],
    );
  }
}
