import 'package:cyberclub_tournaments/core/error/error_handler.dart';
import 'package:cyberclub_tournaments/datanew/models/notification/notification_model.dart';
import 'package:dio/dio.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> fetchNotifications();
  Future<void> acceptInvite(String requestId);
  Future<void> declineInvite(String requestId);
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final Dio _dio;

  NotificationRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<NotificationModel>> fetchNotifications() async {
    try {
      final response = await _dio.get('/notifications');
      final List list = response.data;
      return list.map((e) => NotificationModel.fromJson(e)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> acceptInvite(String requestId) async {
    try {
      await _dio.post('/teams/invites/$requestId/accept');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> declineInvite(String requestId) async {
    try {
      await _dio.post('/teams/invites/$requestId/decline');
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}
