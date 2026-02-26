import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/fetch_user_tournaments_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/get_user_id_usecase.dart';

part 'user_tournaments_event.dart';
part 'user_tournaments_state.dart';

class UserTournamentsBloc
    extends Bloc<UserTournamentsEvent, UserTournamentsState> {
  final FetchUserTournamentsUsecase _getUserTournaments;
  final GetUserIdUseCase _getUserId;

  UserTournamentsBloc({
    required FetchUserTournamentsUsecase getUserTournaments,
    required GetUserIdUseCase getUserId,
  }) : _getUserTournaments = getUserTournaments,
       _getUserId = getUserId,
       super(UserTournamentsLoading()) {
    on<UserTournamentsStarted>(_onStarted);
    on<UserTournamentsRefreshed>(_onRefreshed);
  }

  Future<void> _onStarted(
    UserTournamentsStarted event,
    Emitter<UserTournamentsState> emit,
  ) async {
    emit(UserTournamentsLoading());
    await _loadData(emit);
  }

  Future<void> _onRefreshed(
    UserTournamentsRefreshed event,
    Emitter<UserTournamentsState> emit,
  ) async {
    await _loadData(emit);
  }

  Future<void> _loadData(Emitter<UserTournamentsState> emit) async {
    try {
      final userTournaments = await _getUserTournaments();
      final userId = await _getUserId();

      final now = DateTime.now();
      final active = <TournamentEntity>[];
      final upcoming = <TournamentEntity>[];
      final finished = <TournamentEntity>[];

      for (final tournament in userTournaments) {
        if (tournament.status == TournamentStatus.live) {
          active.add(tournament);
        } else if (tournament.status == TournamentStatus.finished ||
            tournament.status == TournamentStatus.cancelled) {
          finished.add(tournament);
        } else if (tournament.startDate.isAfter(now)) {
          upcoming.add(tournament);
        }
      }

      emit(
        UserTournamentsLoaded(
          activeTournaments: active,
          upcomingTournaments: upcoming,
          finishedTournaments: finished,
          currentUserId: userId ?? '',
        ),
      );
    } on AppException catch (e) {
      emit(UserTournamentsError(errorMessage: e.message));
    } catch (_) {
      emit(const UserTournamentsError(errorMessage: 'Ошибка загрузки'));
    }
  }
}
