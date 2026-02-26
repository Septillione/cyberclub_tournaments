import 'package:cyberclub_tournaments/core/error/app_exception.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/fetch_team_details_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/join_request_entity.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/get_join_requests_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/accept_join_request_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/reject_join_request_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/promote_teammate_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/kick_teammate_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/leave_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/team/delete_team_usecase.dart';
import 'package:cyberclub_tournaments/domain/usecases/auth/get_user_id_usecase.dart';

part 'team_detail_event.dart';
part 'team_detail_state.dart';

class TeamDetailBloc extends Bloc<TeamDetailEvent, TeamDetailState> {
  final FetchTeamDetailsUsecase _getTeamDetails;
  final GetJoinRequestsUseCase _getJoinRequests;
  final AcceptJoinRequestUseCase _acceptRequest;
  final RejectJoinRequestUseCase _rejectRequest;
  final PromoteTeammateUseCase _promoteTeammate;
  final KickTeammateUseCase _kickTeammate;
  final LeaveTeamUseCase _leaveTeam;
  final DeleteTeamUsecase _deleteTeam;
  final GetUserIdUseCase _getUserId;

  TeamDetailBloc({
    required FetchTeamDetailsUsecase getTeamDetails,
    required GetJoinRequestsUseCase getJoinRequests,
    required AcceptJoinRequestUseCase acceptRequest,
    required RejectJoinRequestUseCase rejectRequest,
    required PromoteTeammateUseCase promoteTeammate,
    required KickTeammateUseCase kickTeammate,
    required LeaveTeamUseCase leaveTeam,
    required DeleteTeamUsecase deleteTeam,
    required GetUserIdUseCase getUserId,
  }) : _getTeamDetails = getTeamDetails,
       _getJoinRequests = getJoinRequests,
       _acceptRequest = acceptRequest,
       _rejectRequest = rejectRequest,
       _promoteTeammate = promoteTeammate,
       _kickTeammate = kickTeammate,
       _leaveTeam = leaveTeam,
       _deleteTeam = deleteTeam,
       _getUserId = getUserId,
       super(TeamDetailLoading()) {
    on<TeamDetailStarted>(_onStarted);
    on<AcceptRequestClicked>(_onAcceptRequest);
    on<RejectRequestClicked>(_onRejectRequest);
    on<TeamDetailPromoteTeammate>(_onPromoteTeammate);
    on<TeamDetailKickTeammate>(_onKickTeammate);
    on<TeamDetailLeaveClicked>(_onLeaveTeam);
    on<TeamDetailDeleteClicked>(_onDeleteTeam);
  }

  Future<void> _onStarted(
    TeamDetailStarted event,
    Emitter<TeamDetailState> emit,
  ) async {
    emit(TeamDetailLoading());
    try {
      final team = await _getTeamDetails(event.teamId);
      final currentUserId = await _getUserId();

      final isCaptain = team.ownerId == currentUserId;
      final isMember = team.members.any((m) => m.userId == currentUserId);

      List<JoinRequestEntity> requests = [];
      if (isCaptain) {
        requests = await _getJoinRequests(event.teamId);
      }

      emit(
        TeamDetailLoaded(
          team: team,
          isCaptain: isCaptain,
          isMember: isMember,
          joinRequests: requests,
          currentUserId: currentUserId ?? '',
        ),
      );
    } on AppException catch (e) {
      emit(TeamDetailError(errorMessage: e.message));
    } catch (_) {
      emit(const TeamDetailError(errorMessage: 'Не удалось загрузить команду'));
    }
  }

  Future<void> _onAcceptRequest(
    AcceptRequestClicked event,
    Emitter<TeamDetailState> emit,
  ) async {
    await _performAction(
      () => _acceptRequest(event.requestId),
      emit,
      reload: true,
    );
  }

  Future<void> _onRejectRequest(
    RejectRequestClicked event,
    Emitter<TeamDetailState> emit,
  ) async {
    await _performAction(
      () => _rejectRequest(event.requestId),
      emit,
      reload: true,
    );
  }

  Future<void> _onPromoteTeammate(
    TeamDetailPromoteTeammate event,
    Emitter<TeamDetailState> emit,
  ) async {
    await _performAction(
      () => _promoteTeammate(event.teamId, event.userId),
      emit,
      reload: true,
    );
  }

  Future<void> _onKickTeammate(
    TeamDetailKickTeammate event,
    Emitter<TeamDetailState> emit,
  ) async {
    await _performAction(
      () => _kickTeammate(event.teamId, event.userId),
      emit,
      reload: true,
    );
  }

  Future<void> _onLeaveTeam(
    TeamDetailLeaveClicked event,
    Emitter<TeamDetailState> emit,
  ) async {
    await _performAction(() => _leaveTeam(event.teamId), emit);
  }

  Future<void> _onDeleteTeam(
    TeamDetailDeleteClicked event,
    Emitter<TeamDetailState> emit,
  ) async {
    await _performAction(() => _deleteTeam(event.teamId), emit);
  }

  // Хелпер
  Future<void> _performAction(
    Future<void> Function() action,
    Emitter<TeamDetailState> emit, {
    bool reload = false,
  }) async {
    try {
      await action();
      if (reload && state is TeamDetailLoaded) {
        add(TeamDetailStarted(teamId: (state as TeamDetailLoaded).team.id));
      }
    } on AppException catch (e) {
      emit(TeamDetailError(errorMessage: e.message));
    } catch (_) {
      emit(const TeamDetailError(errorMessage: 'Ошибка выполнения операции'));
    }
  }
}
