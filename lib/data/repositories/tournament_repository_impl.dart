import 'package:cyberclub_tournaments/data/datasources/tournament_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/mappers/tournament_mapper.dart';
import 'package:cyberclub_tournaments/domain/entities/admin_stats.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_filter.dart';
import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class TournamentRepositoryImpl implements TournamentRepository {
  final TournamentRemoteDataSource _dataSource;

  TournamentRepositoryImpl({required TournamentRemoteDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<TournamentEntity>> fetchTournaments({
    TournamentFilter? filter,
  }) async {
    final params = _filterToParams(filter);
    final models = await _dataSource.fetchTournaments(params);
    return models.map(TournamentMapper.toEntity).toList();
  }

  @override
  Future<TournamentEntity?> fetchTournamentById(String id) async {
    final model = await _dataSource.fetchTournamentById(id);
    if (model == null) return null;
    return TournamentMapper.toEntity(model);
  }

  @override
  Future<List<TournamentEntity>> fetchUserTournaments() async {
    final models = await _dataSource.fetchUserTournaments();
    return models.map(TournamentMapper.toEntity).toList();
  }

  @override
  Future<List<TournamentEntity>> fetchOrganizedTournaments() async {
    final models = await _dataSource.fetchOrganizedTournaments();
    return models.map(TournamentMapper.toEntity).toList();
  }

  @override
  Future<void> createTournament(TournamentEntity tournament) async {
    final model = TournamentMapper.toModel(tournament);
    await _dataSource.createTournament(model.toJson());
  }

  @override
  Future<void> updateTournament(TournamentEntity tournament) async {
    final model = TournamentMapper.toModel(tournament);
    await _dataSource.updateTournament(tournament.id, model.toJson());
  }

  @override
  Future<void> deleteTournament(String id) async {
    await _dataSource.deleteTournament(id);
  }

  @override
  Future<void> cancelTournament(String tournamentId) async {
    await _dataSource.cancelTournament(tournamentId);
  }

  @override
  Future<void> joinTournament(String tournamentId, {String? teamId}) async {
    await _dataSource.joinTournament(tournamentId, teamId: teamId);
  }

  @override
  Future<void> startTournament(String tournamentId) async {
    await _dataSource.startTournament(tournamentId);
  }

  @override
  Future<void> finishTournament(String tournamentId) async {
    await _dataSource.finishTournament(tournamentId);
  }

  @override
  Future<void> updateMatchScore(String matchId, int score1, int score2) async {
    await _dataSource.updateMatchScore(matchId, score1, score2);
  }

  @override
  Future<void> disqualifyParticipant(String matchId, int loserPosition) async {
    await _dataSource.disqualifyParticipant(matchId, loserPosition);
  }

  @override
  Future<AdminStats> getAdminStats() async {
    final data = await _dataSource.getAdminStats();

    return AdminStats(
      tournaments: AdminTournamentStats(
        total: data['tournaments']['total'] as int,
        live: data['tournaments']['live'] as int,
        open: data['tournaments']['open'] as int,
      ),
      users: AdminUserStats(
        total: data['users']['total'] as int,
        inTeams: data['users']['inTeams'] as int,
      ),
      teams: AdminTeamStats(
        total: data['teams']['total'] as int,
        active: data['teams']['active'] as int,
      ),
    );
  }

  @override
  List<Discipline> getDisciplines() => Discipline.values;

  Map<String, dynamic> _filterToParams(TournamentFilter? filter) {
    if (filter == null) return {};

    final params = <String, dynamic>{};

    if (filter.discipline != null) {
      params['discipline'] = TournamentMapper.disciplineToJson(
        filter.discipline!,
      );
    }
    if (filter.status != null) {
      params['status'] = TournamentMapper.statusToJson(filter.status!);
    }
    if (filter.teamMode != null) {
      params['teamMode'] = TournamentMapper.teamModeToJson(filter.teamMode!);
    }
    if (filter.isOnline != null) {
      params['isOnline'] = filter.isOnline.toString();
    }
    if (filter.sortOrder != null) {
      params['sortOrder'] = filter.sortOrder!.name;
    }
    if (filter.searchQuery != null && filter.searchQuery!.isNotEmpty) {
      params['search'] = filter.searchQuery;
    }

    return params;
  }
}
