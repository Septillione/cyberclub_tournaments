import 'package:cyberclub_tournaments/domain/entities/admin_stats.dart';
import 'package:cyberclub_tournaments/domain/repositories/tournament_repository.dart';

class GetAdminStatsUsecase {
  final TournamentRepository _repository;

  GetAdminStatsUsecase(this._repository);

  Future<AdminStats> call() {
    return _repository.getAdminStats();
  }
}
