import 'package:cyberclub_tournaments/data/models/UserProfileModel/user_profile_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<UserProfileModel> fetchUserProfile(String userId) async {
    final response = await _apiClient.dio.get('/users/$userId');
    return UserProfileModel.fromJson(response.data);
  }

  Future<String?> uploadUserAvatar(String filePath) async {
    try {
      String fileName = filePath.split('/').last;

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(filePath, filename: fileName),
      });

      print('UPLOADING: $filePath');
      final response = await _apiClient.dio.post('/uploads', data: formData);
      print('UPLOAD RESPONSE: ${response.data}');

      final String relativeUrl = response.data['url'];

      final baseUrl = _apiClient.dio.options.baseUrl.replaceAll('/api/v1', '');

      print('FULL URL: $baseUrl$relativeUrl');
      return '$baseUrl$relativeUrl';
    } catch (e) {
      print('Upload error: $e');
      return null;
    }
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
        if (avatarUrl != null) 'avatarUrl': avatarUrl,
      },
    );
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    print('Old Password: $oldPassword\nNew Password: $newPassword');
    await _apiClient.dio.patch(
      '/users/me/password',
      data: {'oldPassword': oldPassword, 'newPassword': newPassword},
    );
    print('Password was changed in repository');
  }
}
