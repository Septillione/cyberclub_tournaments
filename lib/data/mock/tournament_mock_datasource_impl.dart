// lib/data/datasources/tournament_mock_datasource_impl.dart
import 'package:cyberclub_tournaments/data/datasources/tournament_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/mock/mock_data.dart';
import 'package:cyberclub_tournaments/data/models/tournament/create_tournament_request.dart';
import 'package:cyberclub_tournaments/data/models/tournament/tournament_model.dart';

class TournamentMockDataSourceImpl implements TournamentRemoteDataSource {
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 600));

  @override
  Future<List<TournamentModel>> fetchTournaments(
    Map<String, dynamic> params,
  ) async {
    await _delay();
    print("MOCK: Fetching all tournaments...");
    return mockTournaments;
  }

  @override
  Future<TournamentModel?> fetchTournamentById(String id) async {
    await _delay();
    print("MOCK: Fetching tournament by id: $id");
    final tournament = mockTournaments.where((t) => t.id == id).firstOrNull;
    return tournament != null
        ? TournamentModel.fromJson(tournament.toJson())
        : null;
  }

  @override
  Future<List<TournamentModel>> fetchUserTournaments() async {
    await _delay();
    print("MOCK: Fetching user's tournaments...");
    // Возвращаем турниры, где пользователь как-то участвует (проверяем по entries)
    return mockTournaments
        .where((t) => t.entries.any((e) => e.userId == mockCurrentUser.id))
        .toList();
  }

  // --- Остальные методы просто имитируют успех ---
  @override
  Future<List<TournamentModel>> fetchOrganizedTournaments() async {
    await _delay();
    return [];
  }

  @override
  Future<void> createTournament(CreateTournamentRequest request) async {
    await _delay();
    print("MOCK: Create tournament success");
  }

  @override
  Future<void> updateTournament(String id, Map<String, dynamic> data) async {
    await _delay();
    print("MOCK: Update tournament success");
  }

  @override
  Future<void> deleteTournament(String id) async {
    await _delay();
    print("MOCK: Delete tournament success");
  }

  @override
  Future<void> cancelTournament(String id) async {
    await _delay();
    print("MOCK: Cancel tournament success");
  }

  @override
  Future<void> joinTournament(
    String tournamentId, {
    String? teamId,
    List<String>? rosterIds,
  }) async {
    await _delay();
    print("MOCK: Join tournament success");
  }

  @override
  Future<void> startTournament(String tournamentId) async {
    await _delay();
    print("MOCK: Start tournament success");
  }

  @override
  Future<void> finishTournament(String tournamentId) async {
    await _delay();
    print("MOCK: Finish tournament success");
  }

  @override
  Future<void> updateMatchScore(String matchId, int score1, int score2) async {
    await _delay();
    print("MOCK: Update score success");
  }

  @override
  Future<void> disqualifyParticipant(String matchId, int loserPosition) async {
    await _delay();
    print("MOCK: Disqualify success");
  }

  @override
  Future<Map<String, dynamic>> getAdminStats() async {
    await _delay();
    return {};
  }
}
