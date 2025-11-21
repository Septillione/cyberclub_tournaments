import 'package:cyberclub_tournaments/data/models/UserProfileModel/user_profile_model.dart';
import 'package:cyberclub_tournaments/data/providers/api_client.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  final _mockUserProfile = const UserProfileModel(
    id: 'current_user_id',
    nickname: 'Илюха Монеси',
    avatarUrl:
        'https://avatars.mds.yandex.net/i?id=ef0feff28c7826bf124c426dc05d05e9_l-4593232-images-thumbs&n=13',
    tournamentsPlayed: 15,
    tournamentsWon: 12,
    winrate: 78.0,
  );

  Future<UserProfileModel> fetchUserProfile() async {
    return _mockUserProfile;
  }
}
