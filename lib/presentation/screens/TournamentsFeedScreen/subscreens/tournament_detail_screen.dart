import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:cyberclub_tournaments/data/models/tournament_model.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/general_details.dart';
import 'package:cyberclub_tournaments/presentation/screens/TournamentsFeedScreen/widgets/segmented_button_details.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TournamentDetailScreen extends StatefulWidget {
  final TournamentModel tournament;

  const TournamentDetailScreen({super.key, required this.tournament});

  @override
  State<TournamentDetailScreen> createState() => _TournamentDetailScreenState();
}

class _TournamentDetailScreenState extends State<TournamentDetailScreen> {
  int _selectedSegmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderImage(),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
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
                    _buildSegmentContent(),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomBackButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: AppColors.bgSurface.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Icon(
                LucideIcons.arrowLeft,
                size: 24,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderImage() {
    return AspectRatio(
      aspectRatio: 1.4 / 1,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(widget.tournament.imageUrl, fit: BoxFit.cover),
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
              children: [_buildCustomBackButton()],
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
                  widget.tournament.title,
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

  Widget _buildSegmentContent() {
    final List<Widget> segmentContents = [
      GeneralDetails(tournament: widget.tournament),
      const Center(child: Text('Participants')),
      const Center(child: Text('Grid')),
    ];

    return segmentContents[_selectedSegmentIndex];
  }
}
