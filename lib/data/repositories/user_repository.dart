import 'package:cyberclub_tournaments/core/error/error_handler.dart';
import 'package:cyberclub_tournaments/data/models/TeamModel/team_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';
import 'package:cyberclub_tournaments/datanew/models/User/user_model.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<UserModel> fetchUserProfile(String userId) async {
    try {
      final response = await _apiClient.dio.get('/users/$userId');
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
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
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> updateUserProfile({
    String? nickname,
    String? bio,
    String? avatarUrl,
  }) async {
    try {
      await _apiClient.dio.patch(
        '/users/me',
        data: {
          if (nickname != null) 'nickname': nickname,
          if (bio != null) 'bio': bio,
          if (avatarUrl != null) 'avatarUrl': avatarUrl,
        },
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      print('Old Password: $oldPassword\nNew Password: $newPassword');
      await _apiClient.dio.patch(
        '/users/me/password',
        data: {'oldPassword': oldPassword, 'newPassword': newPassword},
      );
      print('Password was changed in repository');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<List<TeamUserShort>> fetchUsersForAdminDashboard(String? query) async {
    try {
      final response = await _apiClient.dio.get(
        '/users',
        queryParameters: query != null && query.isNotEmpty
            ? {'search': query}
            : null,
      );

      final List list = response.data;
      print('USER LIST: $list');
      return list.map((e) => TeamUserShort.fromJson(e)).toList();
    } catch (e) {
      print('Ошибка поиска пользователей: $e');
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> banUser({
    required String userId,
    required String reason,
    int? days,
  }) async {
    try {
      await _apiClient.dio.post(
        '/ban/user',
        data: {
          'userId': userId,
          'reason': reason,
          if (days != null) 'days': days,
        },
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> unbanUser(String userId) async {
    try {
      await _apiClient.dio.post('/ban/unban/user/$userId');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> changeUserRole(String userId, String newRole) async {
    try {
      await _apiClient.dio.patch(
        '/admin/users/$userId/role',
        data: {'role': newRole},
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
