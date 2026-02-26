import 'package:cyberclub_tournaments/data/datasources/notification_remote_datasource.dart';
import 'package:cyberclub_tournaments/data/mappers/notification_mapper.dart';
import 'package:cyberclub_tournaments/domain/entities/notification_entity.dart';
import 'package:cyberclub_tournaments/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _dataSource;

  NotificationRepositoryImpl({required NotificationRemoteDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<NotificationEntity>> fetchNotifications() async {
    final models = await _dataSource.fetchNotifications();
    return models.map(NotificationMapper.toEntity).toList();
  }

  @override
  Future<void> acceptInvite(String requestId) =>
      _dataSource.acceptInvite(requestId);

  @override
  Future<void> declineInvite(String requestId) =>
      _dataSource.declineInvite(requestId);
}
