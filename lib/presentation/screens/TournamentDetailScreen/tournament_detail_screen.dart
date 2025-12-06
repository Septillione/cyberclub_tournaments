import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/bloc/tournament_detail_bloc.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/widgets/general_details.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentDetailScreen/widgets/participants_details.dart';
import 'package:cyberclub_tournaments/presentation/widgets/custom_back_button.dart';
import 'package:cyberclub_tournaments/presentation/widgets/segmented_button_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TournamentDetailScreen extends StatefulWidget {
  final String tournamentId;

  const TournamentDetailScreen({super.key, required this.tournamentId});

  @override
  State<TournamentDetailScreen> createState() => _TournamentDetailScreenState();
}

class _TournamentDetailScreenState extends State<TournamentDetailScreen> {
  int _selectedSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TournamentDetailBloc(
        tournamentRepository: context.read<TournamentRepository>(),
      )..add(TournamentDetailStarted(tournamentId: widget.tournamentId)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: BlocBuilder<TournamentDetailBloc, TournamentDetailState>(
          builder: (context, state) {
            switch (state) {
              case TournamentDetailLoading():
                return const Center(child: CircularProgressIndicator());
              case TournamentDetailError():
                return const Center(child: Text('Error'));
              case TournamentDetailLoaded():
                final tournament = state.tournament;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderImage(tournament),
                      SafeArea(
                        top: false,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SegmentedButtonDetails(
                                segments: const ['Общее', 'Участники', 'Сетка'],
                                initialIndex: _selectedSegmentIndex,
                                onSegmentTapped: (index) {
                                  setState(() {
                                    _selectedSegmentIndex = index;
                                  });
                                },
                              ),
                              SizedBox(height: 24),
                              _buildSegmentContent(tournament),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }

  Widget _buildHeaderImage(TournamentModel tournament) {
    return AspectRatio(
      aspectRatio: 1.4 / 1,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(tournament.imageUrl, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.bgMain,
                  AppColors.bgMain.withValues(alpha: 0.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                  child: CustomBackButton(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tournament.title,
                  style: AppTextStyles.h1,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentContent(TournamentModel tournament) {
    final List<Widget> segmentContents = [
      GeneralDetails(tournament: tournament),
      ParticipantsDetails(tournament: tournament),
      const Center(child: Text('Grid')),
    ];

    return segmentContents[_selectedSegmentIndex];
  }
}
