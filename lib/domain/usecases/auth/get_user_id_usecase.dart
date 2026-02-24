import 'package:cyberclub_tournaments/domain/repositories/auth_repository.dart';

class GetUserIdUseCase {
  final AuthRepository _repository;
  GetUserIdUseCase(this._repository);

  Future<String?> call() => _repository.getUserId();
}
