import 'package:cyberclub_tournaments/data/datasources/user_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/mappers/team_mapper.dart';
import 'package:cyberclub_tournaments/data/mappers/user_mapper.dart';
import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSourceImpl _dataSource;

  UserRepositoryImpl({required UserRemoteDataSourceImpl dataSource})
    : _dataSource = dataSource;

  @override
  Future<UserEntity> fetchUserProfile(String userId) async {
    final model = await _dataSource.fetchUserProfile(userId);
    return UserMapper.toEntity(model);
  }

  @override
  Future<void> updateUserProfile({
    String? nickname,
    String? bio,
    String? avatarUrl,
  }) async {
    final data = <String, dynamic>{};
    if (nickname != null) data['nickname'] = nickname;
    if (bio != null) data['bio'] = bio;
    if (avatarUrl != null) data['avatarUrl'] = avatarUrl;

    await _dataSource.updateUserProfile(data);
  }

  @override
  Future<void> changePassword(String oldPassword, String newPassword) =>
      _dataSource.changePassword(oldPassword, newPassword);

  @override
  Future<String?> uploadUserAvatar(String filePath) =>
      _dataSource.uploadUserAvatar(filePath);

  @override
  Future<List<TeamUserShort>> searchUsers(String? query) async {
    final models = await _dataSource.searchUsers(query);
    return models.map(TeamMapper.userShortToEntity).toList();
  }

  @override
  Future<void> banUser({
    required String userId,
    required String reason,
    int? days,
  }) async {
    final data = <String, dynamic>{'userId': userId, 'reason': reason};
    if (days != null) data['days'] = days;

    await _dataSource.banUser(data);
  }

  @override
  Future<void> unbanUser(String userId) => _dataSource.unbanUser(userId);

  @override
  Future<void> changeUserRole(String userId, UserRole newRole) =>
      _dataSource.changeUserRole(userId, UserMapper.roleToJson(newRole));
}
