import 'package:cyberclub_tournaments/data/models/UserProfileModel/user_profile_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<UserProfileModel> fetchUserProfile(String userId) async {
    final response = await _apiClient.dio.get('/users/$userId');
    return UserProfileModel.fromJson(response.data);
  }
}
