import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/create_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/update_team_usecase.dart';

part 'create_team_event.dart';
part 'create_team_state.dart';

class CreateTeamBloc extends Bloc<CreateTeamEvent, CreateTeamState> {
  final CreateTeamUsecase _createTeam;
  final UpdateTeamUseCase _updateTeam;

  CreateTeamBloc({
    required CreateTeamUsecase createTeam,
    required UpdateTeamUseCase updateTeam,
  }) : _createTeam = createTeam,
       _updateTeam = updateTeam,
       super(CreateTeamInitial()) {
    on<CreateTeamSubmitted>(_onCreateSubmitted);
    on<UpdateTeamSubmitted>(_onUpdateSubmitted);
  }

  Future<void> _onCreateSubmitted(
    CreateTeamSubmitted event,
    Emitter<CreateTeamState> emit,
  ) async {
    emit(CreateTeamLoading());
    try {
      await _createTeam(_buildTeamEntity(event));
      emit(CreateTeamSuccess(isEditing: false));
    } on AppException catch (e) {
      emit(CreateTeamFailure(errorMessage: e.message));
    } catch (_) {
      emit(CreateTeamFailure(errorMessage: 'Не удалось создать команду'));
    }
  }

  Future<void> _onUpdateSubmitted(
    UpdateTeamSubmitted event,
    Emitter<CreateTeamState> emit,
  ) async {
    emit(CreateTeamLoading());
    try {
      await _updateTeam(_buildTeamEntityForUpdate(event));
      emit(CreateTeamSuccess(isEditing: true));
    } on AppException catch (e) {
      emit(CreateTeamFailure(errorMessage: e.message));
    } catch (_) {
      emit(CreateTeamFailure(errorMessage: 'Не удалось обновить команду'));
    }
  }

  TeamEntity _buildTeamEntity(CreateTeamSubmitted event) {
    return TeamEntity(
      id: '',
      name: event.name,
      tag: event.tag,
      description: event.description,
      socialMedia: event.socialMedia,
      avatarUrl: event.avatarUrl,
      gamesList: event.gamesList,
      ownerId: '',
    );
  }

  TeamEntity _buildTeamEntityForUpdate(UpdateTeamSubmitted event) {
    return TeamEntity(
      id: event.teamId,
      name: event.name,
      tag: event.tag,
      description: event.description,
      socialMedia: event.socialMedia,
      avatarUrl: event.avatarUrl,
      gamesList: event.gamesList,
      ownerId: '',
    );
  }
}
