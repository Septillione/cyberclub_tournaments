import 'package:cyberclub_tournaments/data/models/tournament_model.dart';
import 'package:equatable/equatable.dart';

class TeammateModel {
  final String id;
  final String name;
  final String avatarUrl;
  final bool isCaptain;

  const TeammateModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.isCaptain = false,
  });

  @override
  List<Object> get props => [id, name, avatarUrl, isCaptain];
}

class TeamApplicationModel {
  final String id;
  final String playerName;
  final String playerAvatarUrl;

  const TeamApplicationModel({
    required this.id,
    required this.playerName,
    required this.playerAvatarUrl,
  });

  @override
  List<Object> get props => [id, playerName, playerAvatarUrl];
}

class TeamListItemModel extends Equatable {
  final String id;
  final String name;
  final String tag;
  final String avatarUrl;
  final bool isCurrentUserCaptain;
  final int teammatesCount;
  final List<String> teammatesAvatarUrls;

  const TeamListItemModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.avatarUrl,
    required this.isCurrentUserCaptain,
    required this.teammatesCount,
    this.teammatesAvatarUrls = const [],
  });

  @override
  List<Object?> get props => [id, name, tag, teammatesAvatarUrls];
}

class TeamDetailModel {
  final String id;
  final String name;
  final String tag;
  final String avatarUrl;
  final int tournamentsCount;
  final int winsCount;
  final double winrate;
  final bool isCurrentUserCaptain;
  final List<TeammateModel> teammates;
  final List<TournamentModel> tournaments;
  final List<TeamApplicationModel> applications;
  final String inviteLink;

  const TeamDetailModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.avatarUrl,
    required this.tournamentsCount,
    required this.winsCount,
    required this.winrate,
    required this.isCurrentUserCaptain,
    required this.teammates,
    required this.tournaments,
    required this.applications,
    required this.inviteLink,
  });

  TeamDetailModel copyWith({
    String? id,
    String? name,
    String? tag,
    String? avatarUrl,
    int? tournamentsCount,
    int? winsCount,
    double? winrate,
    bool? isCurrentUserCaptain,
    List<TeammateModel>? teammates,
    List<TournamentModel>? tournaments,
    List<TeamApplicationModel>? applications,
    String? inviteLink,
  }) {
    return TeamDetailModel(
      id: id ?? this.id,
      name: name ?? this.name,
      tag: tag ?? this.tag,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      tournamentsCount: tournamentsCount ?? this.tournamentsCount,
      winsCount: winsCount ?? this.winsCount,
      winrate: winrate ?? this.winrate,
      isCurrentUserCaptain: isCurrentUserCaptain ?? this.isCurrentUserCaptain,
      teammates: teammates ?? this.teammates,
      tournaments: tournaments ?? this.tournaments,
      applications: applications ?? this.applications,
      inviteLink: inviteLink ?? this.inviteLink,
    );
  }

  @override
  List<Object> get props => [id, name, tag, teammates, tournaments];
}
