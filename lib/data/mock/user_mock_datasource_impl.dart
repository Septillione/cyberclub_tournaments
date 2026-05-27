// lib/data/datasources/user_mock_datasource_impl.dart
import 'package:cyberclub_tournaments/data/datasources/user_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/mock/mock_data.dart';
import 'package:cyberclub_tournaments/data/models/team/team_model.dart';
import 'package:cyberclub_tournaments/data/models/user/user_model.dart';

class UserMockDataSourceImpl implements UserRemoteDataSource {
  Future<void> _delay() => Future.delayed(const Duration(milliseconds: 400));

  @override
  Future<UserModel> fetchUserProfile(String userId) async {
    await _delay();
    print("MOCK: Fetching profile for user id: $userId");
    // Если id 'me', то это текущий юзер. Иначе ищем по id.
    if (userId == 'me') return mockCurrentUser;
    return mockUsers.firstWhere(
      (user) => user.id == userId,
      orElse: () => mockCurrentUser,
    );
  }

  // --- Остальные методы просто имитируют успех ---
  @override
  Future<void> updateUserProfile(Map<String, dynamic> data) async {
    await _delay();
    print("MOCK: Profile updated");
  }

  @override
  Future<void> changePassword(String oldPassword, String newPassword) async {
    await _delay();
    print("MOCK: Password changed");
  }

  @override
  Future<String?> uploadUserAvatar(String filePath) async {
    await _delay();
    return "https://i.pravatar.cc/150";
  }

  @override
  Future<List<TeamUserShortModel>> searchUsers(String? query) async {
    await _delay();
    return [];
  }

  @override
  Future<void> banUser(Map<String, dynamic> data) async {
    await _delay();
  }

  @override
  Future<void> unbanUser(String userId) async {
    await _delay();
  }

  @override
  Future<void> changeUserRole(String userId, String role) async {
    await _delay();
  }
}
