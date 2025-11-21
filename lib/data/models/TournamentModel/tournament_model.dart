import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament_model.freezed.dart';
part 'tournament_model.g.dart';

enum TournamentStatus {
  @JsonValue('announced')
  announced,
  @JsonValue('registrationOpened')
  registrationOpened,
  @JsonValue('registrationClosed')
  registrationClosed,
  @JsonValue('live')
  live,
  @JsonValue('finished')
  finished,
  @JsonValue('cancelled')
  cancelled,
}

@freezed
abstract class TournamentParticipants with _$TournamentParticipants {
  const factory TournamentParticipants({
    required int currentParticipants,
    required int maxParticipants,
  }) = _TournamentParticipants;

  factory TournamentParticipants.fromJson(Map<String, dynamic> json) =>
      _$TournamentParticipantsFromJson(json);
}

@freezed
abstract class TournamentPrizes with _$TournamentPrizes {
  const factory TournamentPrizes({
    String? firstPlace,
    String? secondPlace,
    String? thirdPlace,
  }) = _TournamentPrizes;

  factory TournamentPrizes.fromJson(Map<String, dynamic> json) =>
      _$TournamentPrizesFromJson(json);
}

@freezed
abstract class TournamentModel with _$TournamentModel {
  const factory TournamentModel({
    required String id,
    required String title,
    required String imageUrl,
    required String discipline,
    required int prizePool,
    required String type,
    String? address,
    required String format,
    required String formatVersus,
    required String description,
    required String rules,
    required DateTime startDate,
    required TournamentStatus status,

    @Default([]) List<String> registeredPlayerIds,

    required TournamentParticipants participants,
    required TournamentPrizes prizes,
  }) = _TournamentModel;

  factory TournamentModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentModelFromJson(json);
}
