import 'package:cyberclub_tournaments/data/models/UserProfileModel/user_profile_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<UserProfileModel> fetchUserProfile(String userId) async {
    final response = await _apiClient.dio.get('/users/$userId');
    return UserProfileModel.fromJson(response.data);
  }

  Future<void> updateUserProfile({
    String? nickname,
    String? bio,
    String? avatarUrl,
  }) async {
    await _apiClient.dio.patch(
      '/users/me',
      data: {
        if (nickname != null) 'nickname': nickname,
        if (bio != null) 'bio': bio,
        if (avatarUrl != null) 'avatar_url': avatarUrl,
      },
    );
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    await _apiClient.dio.patch(
      'users/me/password',
      data: {'oldPassword': oldPassword, 'newPassword': newPassword},
    );
  }
}
