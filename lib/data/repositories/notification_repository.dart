import 'package:cyberclub_tournaments/core/utils/error_handler.dart';
import 'package:cyberclub_tournaments/data/models/NotificationModel/notification_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';

class NotificationRepository {
  final ApiClient _apiClient;
  NotificationRepository({required ApiClient apiClient})
    : _apiClient = apiClient;

  Future<List<NotificationModel>> fetchNotifications() async {
    try {
      final response = await _apiClient.dio.get('/notifications');
      final List list = response.data;
      return list.map((e) => NotificationModel.fromJson(e)).toList();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  Future<void> acceptInvite(String requestId) async {
    await _apiClient.dio.post('/teams/invites/$requestId/accept');
  }

  Future<void> declineInvite(String requestId) async {
    await _apiClient.dio.post('/teams/invites/$requestId/decline');
  }
}
