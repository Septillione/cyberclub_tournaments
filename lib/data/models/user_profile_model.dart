import 'package:equatable/equatable.dart';

class UserProfileModel extends Equatable {
  final String id;
  final String nickname;
  final String? avatarUrl;
  final int tournamentsPlayed;
  final int tournamentsWon;
  final double winrate;

  const UserProfileModel({
    required this.id,
    required this.nickname,
    this.avatarUrl,
    required this.tournamentsPlayed,
    required this.tournamentsWon,
    required this.winrate,
  });

  @override
  List<Object> get props => [
    id,
    nickname,
    ?avatarUrl,
    tournamentsPlayed,
    tournamentsWon,
    winrate,
  ];
}
