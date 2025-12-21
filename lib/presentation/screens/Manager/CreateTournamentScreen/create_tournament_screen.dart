import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/Manager/CreateTournamentScreen/bloc/create_tournament_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final Map<Discipline, List<String>> _coverPresets = {
  Discipline.DOTA2: [
    'assets/images/covers/dota2_1.jpeg',
    'https://via.placeholder.com/300',
  ],
  Discipline.CS2: [
    'assets/images/covers/cs2_1.jpg',
    'assets/images/covers/mk1_1.jpg',
    'assets/images/covers/mk1_1.jpg',
  ],
  Discipline.MORTAL_KOMBAT: ['assets/images/covers/mk1_1.jpg'],
};

const _defaultCover = '';

class PrizeInput {
  String label;
  String amount;
  PrizeInput({required this.label, required this.amount});
}

class CreateTournamentScreen extends StatelessWidget {
  const CreateTournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTournamentBloc(
        tournamentRepository: context.read<TournamentRepository>(),
      ),
      child: _CreateTournamentView(),
    );
  }
}

class _CreateTournamentView extends StatefulWidget {
  const _CreateTournamentView();

  @override
  State<_CreateTournamentView> createState() => _CreateTournamentViewState();
}

class _CreateTournamentViewState extends State<_CreateTournamentView> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _rulesController = TextEditingController();
  final _prizePoolController = TextEditingController();

  String _selectedImageUrl = '';
  bool _isOnline = true;
  final _addressController = TextEditingController();

  List<PrizeInput> _prizes = [
    PrizeInput(label: '1 место', amount: ''),
    PrizeInput(label: '2 место', amount: ''),
    PrizeInput(label: '3 место', amount: ''),
  ];

  Discipline _discipline = Discipline.DOTA2;
  BracketType _bracketType = BracketType.SINGLE_ELIMINATION;
  TeamMode _teamMode = TeamMode.team5v5;
  int _maxParticipants = 16;

  DateTime _startDate = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _startTime = const TimeOfDay(hour: 18, minute: 0);

  final _participantsAmount = [4, 8, 16, 32, 64];

  Future<void> _pickDate() async {
    final data = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (data != null) setState(() => _startDate = data);
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (time != null) setState(() => _startTime = time);
  }

  void _onCreateTournament() {
    if (!_formKey.currentState!.validate()) return;

    final fullDate = DateTime(
      _startDate.year,
      _startDate.month,
      _startDate.day,
      _startTime.hour,
      _startDate.minute,
    );

    final prizesToSend = _prizes
        .where((p) => p.amount.isNotEmpty)
        .map((p) => PrizeItem(label: p.label, amount: p.amount))
        .toList();

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
        imageUrl: _selectedImageUrl,
        isOnline: _isOnline,
        address: _addressController.text.trim(),
        prizes: prizesToSend,
      ),
    );
  }

  void _updateCoverPresets() {
    final presets = _coverPresets[_discipline] ?? [_defaultCover];
    setState(() {
      if (!presets.contains(_selectedImageUrl)) {
        _selectedImageUrl = presets.first;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _updateCoverPresets();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateTournamentBloc, CreateTournamentState>(
      listener: (context, state) {
        if (state is CreateTournamentSuccess) {
          context.pop();
        }
        if (state is CreateTournamentFailure) {
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
            child: BlocBuilder<CreateTournamentBloc, CreateTournamentState>(
              builder: (context, state) {
                if (state is CreateTournamentLoading ||
                    state is CreateTournamentSuccess) {
                  return const Center(child: CircularProgressIndicator());
                }

                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Основное', style: AppTextStyles.h3),

                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: 'Название',
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) =>
                              v!.isEmpty ? 'Введите название' : null,
                        ),

                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Описание',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                          validator: (v) =>
                              v!.isEmpty ? 'Введите описание' : null,
                        ),

                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _rulesController,
                          decoration: const InputDecoration(
                            labelText: 'Правила',
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) =>
                              v!.isEmpty ? 'Введите правила' : null,
                        ),

                        const SizedBox(height: 16),

                        Text('Обложка турнира', style: AppTextStyles.h3),

                        const SizedBox(height: 12),

                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children:
                                (_coverPresets[_discipline] ?? [_defaultCover])
                                    .map((url) {
                                      final isSelected =
                                          _selectedImageUrl == url;

                                      return GestureDetector(
                                        onTap: () => setState(
                                          () => _selectedImageUrl = url,
                                        ),
                                        child: AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          width: 200,
                                          margin: const EdgeInsets.only(
                                            right: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: isSelected
                                                ? Border.all(
                                                    color:
                                                        AppColors.accentPrimary,
                                                    width: 3,
                                                  )
                                                : Border.all(
                                                    color: Colors.transparent,
                                                    width: 3,
                                                  ),
                                            image: DecorationImage(
                                              image: url.startsWith('http')
                                                  ? NetworkImage(url)
                                                  : AssetImage(url)
                                                        as ImageProvider,
                                              fit: BoxFit.cover,
                                              colorFilter: isSelected
                                                  ? null
                                                  : const ColorFilter.mode(
                                                      Colors.black45,
                                                      BlendMode.darken,
                                                    ),
                                            ),
                                          ),
                                          child: isSelected
                                              ? const Center(
                                                  child: Icon(
                                                    Icons.check_circle,
                                                    color: Colors.white,
                                                    size: 32,
                                                  ),
                                                )
                                              : null,
                                        ),
                                      );
                                    })
                                    .toList(),
                          ),
                        ),

                        const SizedBox(height: 32),

                        Text('Игра и форматы', style: AppTextStyles.h3),

                        const SizedBox(height: 16),

                        DropdownButtonFormField<Discipline>(
                          initialValue: _discipline,
                          items: Discipline.values
                              .map(
                                (d) => DropdownMenuItem(
                                  value: d,
                                  child: Text(d.title),
                                ),
                              )
                              .toList(),
                          onChanged: (v) {
                            if (v != null) {
                              setState(() => _discipline = v);
                              _updateCoverPresets();
                            }
                          },
                          decoration: const InputDecoration(
                            labelText: 'Игра',
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 16),

                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<TeamMode>(
                                initialValue: _teamMode,
                                decoration: const InputDecoration(
                                  labelText: 'Режим',
                                  border: OutlineInputBorder(),
                                ),
                                items: TeamMode.values
                                    .map(
                                      (v) => DropdownMenuItem(
                                        value: v,
                                        child: Text(v.name),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => _teamMode = v!),
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: DropdownButtonFormField(
                                initialValue: _maxParticipants,
                                decoration: const InputDecoration(
                                  labelText: 'Команд',
                                  border: OutlineInputBorder(),
                                ),
                                items: _participantsAmount
                                    .map(
                                      (i) => DropdownMenuItem(
                                        value: i,
                                        child: Text(i.toString()),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => _maxParticipants = v!),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        DropdownButtonFormField<BracketType>(
                          initialValue: _bracketType,
                          decoration: const InputDecoration(
                            labelText: 'Тип сетки',
                            border: OutlineInputBorder(),
                          ),
                          items: BracketType.values
                              .map(
                                (b) => DropdownMenuItem(
                                  value: b,
                                  child: Text(b.name),
                                ),
                              )
                              .toList(),
                          onChanged: (v) => setState(() => _bracketType = v!),
                        ),

                        const SizedBox(height: 32),

                        Text('Проведение', style: AppTextStyles.h3),

                        const SizedBox(width: 16),

                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: _pickDate,
                                icon: const Icon(LucideIcons.calendar),
                                label: Text(
                                  '${_startDate.day}.${_startDate.month}.${_startDate.year}',
                                ),
                              ),
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: _pickTime,
                                label: Text(
                                  '${_startTime.hour}:${_startTime.minute}',
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        Row(
                          children: [
                            const Text(
                              'Формат',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 8),
                            ChoiceChip(
                              label: const Text('Онлайн'),
                              selected: _isOnline,
                              onSelected: (val) =>
                                  setState(() => _isOnline = true),
                            ),
                            const SizedBox(width: 8),
                            ChoiceChip(
                              label: const Text('Офлайн'),
                              selected: !_isOnline,
                              onSelected: (val) =>
                                  setState(() => _isOnline = false),
                            ),
                          ],
                        ),

                        if (!_isOnline) ...[
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _addressController,
                            decoration: const InputDecoration(
                              labelText: 'Адрес клуба / Места проведения',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(LucideIcons.locate),
                            ),
                            validator: (v) =>
                                (!_isOnline && (v == null || v.isEmpty))
                                ? 'Укажите адрес'
                                : null,
                          ),
                        ],

                        const SizedBox(height: 16),

                        _buildPrizesSection(),

                        const SizedBox(height: 32),

                        ElevatedButton(
                          onPressed: _onCreateTournament,
                          child: const Text('Создать турнир'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrizesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Призовые места', style: AppTextStyles.h3),
        const SizedBox(height: 8),

        ..._prizes.asMap().entries.map((entry) {
          final index = entry.key;
          final prize = entry.value;

          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    initialValue: prize.label,
                    decoration: InputDecoration(
                      labelText: 'Место',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) => prize.label = v,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    initialValue: prize.amount,
                    decoration: const InputDecoration(
                      labelText: 'Приз',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) => prize.amount = v,
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => _prizes.removeAt(index)),
                  icon: Icon(LucideIcons.trash, color: AppColors.statusError),
                ),
              ],
            ),
          );
        }),
        TextButton.icon(
          onPressed: () => setState(
            () => _prizes.add(
              PrizeInput(label: '${_prizes.length + 1} место', amount: ''),
            ),
          ),
          label: const Text('Добавить призовое место'),
          icon: Icon(LucideIcons.circlePlus),
        ),
      ],
    );
  }
}
