import 'dart:async';
import 'dart:math';

import 'package:cyberclub_tournaments/data/models/BracketModel/bracket_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bracket_event.dart';
part 'bracket_state.dart';

class BracketBloc extends Bloc<BracketEvent, BracketState> {
  Timer? timer;

  BracketBloc() : super(BracketLoading()) {
    // on<BracketStarted>(_onStarted);
    // on<BracketMatchUpdated>(_onMatchUpdated);
  }

  void _onStarted(BracketStarted event, Emitter<BracketState> emit) {
    final participants = List.generate(
      8,
      (i) => BracketParticipant(
        'P$i',
        'Team ${String.fromCharCode(65 + i)}',
        avatarUrl: 'https://i.pravatar.cc/150?u=team$i',
      ),
    );

    List<BracketMatch> firstRoundMatches = [];
    for (int i = 0; i < participants.length; i += 2) {
      firstRoundMatches.add(
        BracketMatch(player1: participants[i], player2: participants[i + 1]),
      );
    }

    List<List<BracketMatch>> rounds = [
      firstRoundMatches,
      List.generate(2, (i) => BracketMatch()),
      List.generate(1, (i) => BracketMatch()),
    ];

    emit(BracketLoaded(rounds));
  }

  void _onMatchUpdated(BracketMatchUpdated event, Emitter<BracketState> emit) {
    if (state is! BracketLoaded) return;
    final currentRounds = (state as BracketLoaded).rounds;

    final newRounds = currentRounds
        .map((round) => round.map((match) => match.copyWith()).toList())
        .toList();

    final matchToUpdate = newRounds[event.roundIndex][event.matchIndex];

    if (matchToUpdate.score1 != 0 ||
        matchToUpdate.score2 != 0 ||
        matchToUpdate.player1 == null ||
        matchToUpdate.player2 == null) {
      return;
    }

    matchToUpdate.score1 = Random().nextBool() ? 2 : 1;
    matchToUpdate.score2 = 2 - matchToUpdate.score1;
    final winner = matchToUpdate.score1 > matchToUpdate.score2
        ? matchToUpdate.player1!
        : matchToUpdate.player2!;

    final nextRoundIndex = event.roundIndex + 1;
    if (nextRoundIndex < newRounds.length) {
      
    }
  }
}
