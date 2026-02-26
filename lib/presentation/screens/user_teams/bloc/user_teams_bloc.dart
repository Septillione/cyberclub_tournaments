import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/fetch_user_teams_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/search_teams_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/send_join_request_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/get_user_id_usecase.dart';

part 'user_teams_event.dart';
part 'user_teams_state.dart';

const _debounceDuration = Duration(milliseconds: 500);

EventTransformer<Event> _debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class UserTeamsBloc extends Bloc<UserTeamsEvent, UserTeamsState> {
  final FetchUserTeamsUsecase _getUserTeams;
  final SearchTeamsUsecase _searchTeams;
  final SendJoinRequestUseCase _sendJoinRequest;
  final GetUserIdUseCase _getUserId;

  UserTeamsBloc({
    required FetchUserTeamsUsecase getUserTeams,
    required SearchTeamsUsecase searchTeams,
    required SendJoinRequestUseCase sendJoinRequest,
    required GetUserIdUseCase getUserId,
  }) : _getUserTeams = getUserTeams,
       _searchTeams = searchTeams,
       _sendJoinRequest = sendJoinRequest,
       _getUserId = getUserId,
       super(UserTeamsLoading()) {
    on<UserTeamsStarted>(_onStarted);
    on<UserTeamsRefreshed>(_onRefreshed);
    on<TeamsSearchStarted>(_onSearchStarted);
    on<TeamsSearchQueryChanged>(
      _onSearchQueryChanged,
      transformer: _debounce(_debounceDuration),
    );
    on<TeamsSearchJoinRequested>(_onJoinRequested);
  }

  Future<void> _onStarted(
    UserTeamsStarted event,
    Emitter<UserTeamsState> emit,
  ) async {
    emit(UserTeamsLoading());
    try {
      final teams = await _getUserTeams();
      final userId = await _getUserId();
      emit(UserTeamsLoaded(teams: teams, currentUserId: userId ?? ''));
    } on AppException catch (e) {
      emit(UserTeamsError(e.message));
    } catch (_) {
      emit(const UserTeamsError('Ошибка загрузки команд'));
    }
  }

  Future<void> _onRefreshed(
    UserTeamsRefreshed event,
    Emitter<UserTeamsState> emit,
  ) async {
    await _onStarted(UserTeamsStarted(), emit);
  }

  Future<void> _onSearchStarted(
    TeamsSearchStarted event,
    Emitter<UserTeamsState> emit,
  ) async {
    emit(UserTeamsLoading());
    try {
      final teams = await _searchTeams('');
      final userId = await _getUserId();
      emit(UserTeamsLoaded(teams: teams, currentUserId: userId ?? ''));
    } on AppException catch (e) {
      emit(UserTeamsError(e.message));
    } catch (_) {
      emit(const UserTeamsError('Ошибка поиска'));
    }
  }

  Future<void> _onSearchQueryChanged(
    TeamsSearchQueryChanged event,
    Emitter<UserTeamsState> emit,
  ) async {
    emit(UserTeamsLoading());
    try {
      final teams = await _searchTeams(event.query);
      final userId = await _getUserId();
      emit(UserTeamsLoaded(teams: teams, currentUserId: userId ?? ''));
    } on AppException catch (e) {
      emit(UserTeamsError(e.message));
    } catch (_) {
      emit(const UserTeamsError('Ошибка поиска'));
    }
  }

  Future<void> _onJoinRequested(
    TeamsSearchJoinRequested event,
    Emitter<UserTeamsState> emit,
  ) async {
    final current = state;
    if (current is! UserTeamsLoaded) return;

    try {
      await _sendJoinRequest(event.teamId);
      emit(
        UserTeamsLoaded(
          teams: current.teams,
          currentUserId: current.currentUserId,
          successMessage: 'Заявка отправлена!',
        ),
      );
      // Сбрасываем сообщение
      emit(
        UserTeamsLoaded(
          teams: current.teams,
          currentUserId: current.currentUserId,
          successMessage: null,
        ),
      );
    } on AppException catch (e) {
      emit(UserTeamsError(e.message));
    } catch (_) {
      emit(const UserTeamsError('Не удалось отправить заявку'));
    }
  }
}
