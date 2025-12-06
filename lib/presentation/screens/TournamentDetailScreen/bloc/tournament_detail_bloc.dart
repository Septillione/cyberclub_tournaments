import 'package:cyberclub_tournaments/data/models/TournamentModel/tournament_model.dart';
import 'package:cyberclub_tournaments/data/repositories/tournament_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament_detail_event.dart';
part 'tournament_detail_state.dart';

class TournamentDetailBloc
    extends Bloc<TournamentDetailEvent, TournamentDetailState> {
  final TournamentRepository _tournamentRepository;

  TournamentDetailBloc({required TournamentRepository tournamentRepository})
    : _tournamentRepository = tournamentRepository,
      super(TournamentDetailLoading()) {
    on<TournamentDetailStarted>(_onStarted);
  }

  Future<void> _onStarted(
    TournamentDetailStarted event,
    Emitter<TournamentDetailState> emit,
  ) async {
    emit(TournamentDetailLoading());
    try {
      final tournament = await _tournamentRepository.fetchTournamentById(
        event.tournamentId,
      );

      if (tournament != null) {
        emit(TournamentDetailLoaded(tournament: tournament));
      } else {
        emit(TournamentDetailError(errorMessage: 'Турнир не найден'));
      }
    } catch (e) {
      emit(TournamentDetailError(errorMessage: e.toString()));
    }
  }
}
