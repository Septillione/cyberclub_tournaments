import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry_model.freezed.dart';
part 'entry_model.g.dart';

@freezed
abstract class EntryModel with _$EntryModel {
  const factory EntryModel({
    required String id,
    required String tournamentId,
    required String teamId,
    @Default([]) List<String> playerIds,
    required String status,
  }) = _EntryModel;

  factory EntryModel.fromJson(Map<String, dynamic> json) =>
      _$EntryModelFromJson(json);
}
