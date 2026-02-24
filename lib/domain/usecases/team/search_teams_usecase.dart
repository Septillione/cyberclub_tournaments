import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class SearchTeamsUsecase {
  final TeamRepository _repository;
  SearchTeamsUsecase(this._repository);

  Future<List<TeamEntity>> call(String? query) =>
      _repository.searchTeams(query);
}
