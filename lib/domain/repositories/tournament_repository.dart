import 'package:cyberclub_tournaments/domain/entities/admin_stats.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/tournament_filter.dart';

abstract class TournamentRepository {
  // Получение
  Future<List<TournamentEntity>> fetchTournaments({TournamentFilter? filter});
  Future<TournamentEntity?> fetchTournamentById(String id);
  Future<List<TournamentEntity>> fetchUserTournaments();
  // Future<List<TournamentEntity>> fetchOrganizedTournaments();

  // Создание и изменение
  Future<void> createTournament(TournamentEntity tournament);
  Future<void> updateTournament(TournamentEntity tournament);
  Future<void> deleteTournament(String tournamentId);
  Future<void> cancelTournament(String tournamentId);

  // Участие
  Future<void> joinTournament(String tournamentId, {String? teamId});

  // Управление турниром
  Future<void> startTournament(String tournamentId);
  Future<void> finishTournament(String tournamentId);
  Future<void> updateMatchScore(String matchId, int score1, int score2);
  Future<void> disqualifyParticipant(String matchId, int loserPosition);

  // Статистика
  Future<AdminStats> getAdminStats();

  // Вспомогательное
  List<Discipline> getDisciplines();
}
