import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/create_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/update_tournament_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/tournament/cancel_tournament_usecase.dart';

part 'create_tournament_event.dart';
part 'create_tournament_state.dart';

class CreateTournamentBloc
    extends Bloc<CreateTournamentEvent, CreateTournamentState> {
  final CreateTournamentUsecase _createTournament;
  final UpdateTournamentUsecase _updateTournament;
  final CancelTournamentUsecase _cancelTournament;

  CreateTournamentBloc({
    required CreateTournamentUsecase createTournament,
    required UpdateTournamentUsecase updateTournament,
    required CancelTournamentUsecase cancelTournament,
  }) : _createTournament = createTournament,
       _updateTournament = updateTournament,
       _cancelTournament = cancelTournament,
       super(CreateTournamentInitial()) {
    on<CreateTournamentSubmitted>(_onCreateSubmitted);
    on<UpdateTournamentSubmitted>(_onUpdateSubmitted);
    on<CancelTournamentSubmitted>(_onCancelSubmitted);
  }

  Future<void> _onCreateSubmitted(
    CreateTournamentSubmitted event,
    Emitter<CreateTournamentState> emit,
  ) async {
    emit(CreateTournamentLoading());
    try {
      await _createTournament(_buildEntity(event));
      emit(const CreateTournamentSuccess(isEditing: false));
    } on AppException catch (e) {
      emit(CreateTournamentFailure(errorMessage: e.message));
    } catch (_) {
      emit(
        const CreateTournamentFailure(
          errorMessage: 'Не удалось создать турнир',
        ),
      );
    }
  }

  Future<void> _onUpdateSubmitted(
    UpdateTournamentSubmitted event,
    Emitter<CreateTournamentState> emit,
  ) async {
    emit(CreateTournamentLoading());
    try {
      await _updateTournament(_buildEntityForUpdate(event));
      emit(const CreateTournamentSuccess(isEditing: true));
    } on AppException catch (e) {
      emit(CreateTournamentFailure(errorMessage: e.message));
    } catch (_) {
      emit(
        const CreateTournamentFailure(
          errorMessage: 'Не удалось обновить турнир',
        ),
      );
    }
  }

  Future<void> _onCancelSubmitted(
    CancelTournamentSubmitted event,
    Emitter<CreateTournamentState> emit,
  ) async {
    emit(CreateTournamentLoading());
    try {
      await _cancelTournament(event.tournamentId);
      emit(const CreateTournamentSuccess());
    } on AppException catch (e) {
      emit(CreateTournamentFailure(errorMessage: e.message));
    } catch (_) {
      emit(
        const CreateTournamentFailure(
          errorMessage: 'Не удалось отменить турнир',
        ),
      );
    }
  }

  TournamentEntity _buildEntity(CreateTournamentSubmitted event) {
    return TournamentEntity(
      id: '',
      title: event.title,
      description: event.description,
      rules: event.rules,
      discipline: event.discipline,
      startDate: event.startDate,
      imageUrl: event.imageUrl ?? '',
      isOnline: event.isOnline,
      address: event.address,
      bracketType: event.bracketType,
      teamMode: event.teamMode,
      status: TournamentStatus.announced,
      participants: ParticipantsInfo(current: 0, max: event.maxParticipants),
      prizes: event.prizes,
    );
  }

  TournamentEntity _buildEntityForUpdate(UpdateTournamentSubmitted event) {
    return TournamentEntity(
      id: event.id,
      title: event.title,
      description: event.description,
      rules: event.rules,
      discipline: event.discipline,
      startDate: event.startDate,
      imageUrl: event.imageUrl ?? '',
      isOnline: event.isOnline,
      address: event.address,
      bracketType: event.bracketType,
      teamMode: event.teamMode,
      status: TournamentStatus.announced,
      participants: ParticipantsInfo(current: 0, max: event.maxParticipants),
      prizes: event.prizes,
    );
  }
}
