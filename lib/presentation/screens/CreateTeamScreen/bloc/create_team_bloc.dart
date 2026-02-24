import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/create_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/update_team_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_team_event.dart';
part 'create_team_state.dart';

class CreateTeamBloc extends Bloc<CreateTeamEvent, CreateTeamState> {
  final CreateTeamUsecase _createTeamUseCase;
  final UpdateTeamUseCase _updateTeamUseCase;

  CreateTeamBloc({
    required CreateTeamUsecase createTeamUseCase,
    required UpdateTeamUseCase updateTeamUseCase,
  }) : _createTeamUseCase = createTeamUseCase,
       _updateTeamUseCase = updateTeamUseCase,
       super(CreateTeamInitial()) {
    on<CreateTeamSubmitted>(_onCreateTeamSubmitted);
    on<UpdateTeamSubmitted>(_onUpdateTeamSubmitted);
  }

  Future<void> _onCreateTeamSubmitted(
    CreateTeamSubmitted event,
    Emitter<CreateTeamState> emit,
  ) async {
    emit(CreateTeamLoading());
    try {
      final team = TeamEntity(
        id: '',
        name: event.name,
        tag: event.tag,
        description: event.description,
        socialMedia: event.socialMedia,
        avatarUrl: event.avatarUrl,
        gamesList: event.gamesList,
        ownerId: '',
      );
      await _createTeamUseCase(team);
      emit(CreateTeamSuccess(isEditing: false));
    } on AppException catch (e) {
      emit(CreateTeamFailure(errorMessage: e.message));
    } catch (e) {
      emit(CreateTeamFailure(errorMessage: 'Не удалось создать команду'));
    }
  }

  Future<void> _onUpdateTeamSubmitted(
    UpdateTeamSubmitted event,
    Emitter<CreateTeamState> emit,
  ) async {
    emit(CreateTeamLoading());
    try {
      final team = TeamEntity(
        id: event.teamId,
        name: event.name,
        tag: event.tag,
        description: event.description,
        socialMedia: event.socialMedia,
        avatarUrl: event.avatarUrl,
        gamesList: event.gamesList,
        ownerId: '',
      );
      await _updateTeamUseCase(team);
      emit(CreateTeamSuccess(isEditing: true));
    } on AppException catch (e) {
      emit(CreateTeamFailure(errorMessage: e.message));
    } catch (e) {
      emit(CreateTeamFailure(errorMessage: 'Не удалось обновить команду'));
    }
  }
}
