import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/team_repository.dart';

class SearchUsersUsecase {
  final TeamRepository _repository;
  SearchUsersUsecase(this._repository);

  Future<List<TeamUserShort>> call(String query) =>
      _repository.searchUsers(query);
}
