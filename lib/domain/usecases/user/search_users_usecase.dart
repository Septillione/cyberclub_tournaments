import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/user_repository.dart';

class SearchUsersUseCase {
  final UserRepository _repository;
  SearchUsersUseCase(this._repository);

  Future<List<TeamUserShort>> call(String? query) =>
      _repository.searchUsers(query);
}
