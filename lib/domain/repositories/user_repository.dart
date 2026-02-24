import 'package:cyberclub_tournaments/domain/entities/team_entity.dart';
import 'package:cyberclub_tournaments/domain/entities/user_entity.dart';

abstract class UserRepository {
  // Профиль
  Future<UserEntity> fetchUserProfile(String userId);
  Future<void> updateUserProfile({
    String? nickname,
    String? bio,
    String? avatarUrl,
  });
  Future<void> changePassword(String oldPassword, String newPassword);
  Future<String?> uploadUserAvatar(String filePath);

  // Поиск
  Future<List<TeamUserShort>> searchUsers(String? query);

  // Админ
  Future<void> banUser({
    required String userId,
    required String reason,
    int? days,
  });
  Future<void> unbanUser(String userId);
  Future<void> changeUserRole(String userId, UserRole newRole);
}
