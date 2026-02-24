import 'package:cyberclub_tournaments/core/error/error_handler.dart';
import 'package:cyberclub_tournaments/datanew/models/team/team_model.dart';
import 'package:cyberclub_tournaments/datanew/models/user/user_model.dart';
import 'package:dio/dio.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> fetchUserProfile(String userId);
  Future<void> updateUserProfile(Map<String, dynamic> data);
  Future<void> changePassword(String oldPassword, String newPassword);
  Future<String?> uploadUserAvatar(String filePath);
  Future<List<TeamUserShortModel>> searchUsers(String? query);
  Future<void> banUser(Map<String, dynamic> data);
  Future<void> unbanUser(String userId);
  Future<void> changeUserRole(String userId, String role);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<UserModel> fetchUserProfile(String userId) async {
    try {
      final response = await _dio.get('/users/$userId');
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> updateUserProfile(Map<String, dynamic> data) async {
    try {
      await _dio.patch('/users/me', data: data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      await _dio.patch(
        '/users/me/password',
        data: {'oldPassword': oldPassword, 'newPassword': newPassword},
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<String?> uploadUserAvatar(String filePath) async {
    try {
      final fileName = filePath.split('/').last;
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
      });

      final response = await _dio.post('/uploads', data: formData);
      final String relativeUrl = response.data['url'];
      final baseUrl = _dio.options.baseUrl.replaceAll('/api/v1', '');

      return '$baseUrl$relativeUrl';
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<List<TeamUserShortModel>> searchUsers(String? query) async {
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: query != null && query.isNotEmpty
            ? {'search': query}
            : null,
      );
      final List list = response.data;
      return list.map((e) => TeamUserShortModel.fromJson(e)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> banUser(Map<String, dynamic> data) async {
    try {
      await _dio.post('/ban/user', data: data);
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> unbanUser(String userId) async {
    try {
      await _dio.post('/ban/unban/user/$userId');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> changeUserRole(String userId, String role) async {
    try {
      await _dio.patch('/admin/users/$userId/role', data: {'role': role});
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
