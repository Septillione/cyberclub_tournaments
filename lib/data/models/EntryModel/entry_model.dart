import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_model.freezed.dart';
part 'entry_model.g.dart';

enum EntryStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('rejected')
  rejected,
}

@freezed
abstract class EntryModel with _$EntryModel {
  const factory EntryModel({
    required String id,
    required String tournamentId,
    required String teamId,
    @Default([]) List<String> playerIds,
    required EntryStatus status,
  }) = _EntryModel;

  factory EntryModel.fromJson(Map<String, dynamic> json) =>
      _$EntryModelFromJson(json);
}
