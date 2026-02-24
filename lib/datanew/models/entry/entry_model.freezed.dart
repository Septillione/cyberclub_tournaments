// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntryModel {

 String get id; String get tournamentId; String get teamId; List<String> get playerIds; String get status;
/// Create a copy of EntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntryModelCopyWith<EntryModel> get copyWith => _$EntryModelCopyWithImpl<EntryModel>(this as EntryModel, _$identity);

  /// Serializes this EntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&const DeepCollectionEquality().equals(other.playerIds, playerIds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tournamentId,teamId,const DeepCollectionEquality().hash(playerIds),status);

@override
String toString() {
  return 'EntryModel(id: $id, tournamentId: $tournamentId, teamId: $teamId, playerIds: $playerIds, status: $status)';
}


}

/// @nodoc
abstract mixin class $EntryModelCopyWith<$Res>  {
  factory $EntryModelCopyWith(EntryModel value, $Res Function(EntryModel) _then) = _$EntryModelCopyWithImpl;
@useResult
$Res call({
 String id, String tournamentId, String teamId, List<String> playerIds, String status
});




}
/// @nodoc
class _$EntryModelCopyWithImpl<$Res>
    implements $EntryModelCopyWith<$Res> {
  _$EntryModelCopyWithImpl(this._self, this._then);

  final EntryModel _self;
  final $Res Function(EntryModel) _then;

/// Create a copy of EntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tournamentId = null,Object? teamId = null,Object? playerIds = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,playerIds: null == playerIds ? _self.playerIds : playerIds // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EntryModel].
extension EntryModelPatterns on EntryModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntryModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntryModel value)  $default,){
final _that = this;
switch (_that) {
case _EntryModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _EntryModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tournamentId,  String teamId,  List<String> playerIds,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntryModel() when $default != null:
return $default(_that.id,_that.tournamentId,_that.teamId,_that.playerIds,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tournamentId,  String teamId,  List<String> playerIds,  String status)  $default,) {final _that = this;
switch (_that) {
case _EntryModel():
return $default(_that.id,_that.tournamentId,_that.teamId,_that.playerIds,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tournamentId,  String teamId,  List<String> playerIds,  String status)?  $default,) {final _that = this;
switch (_that) {
case _EntryModel() when $default != null:
return $default(_that.id,_that.tournamentId,_that.teamId,_that.playerIds,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EntryModel implements EntryModel {
  const _EntryModel({required this.id, required this.tournamentId, required this.teamId, final  List<String> playerIds = const [], required this.status}): _playerIds = playerIds;
  factory _EntryModel.fromJson(Map<String, dynamic> json) => _$EntryModelFromJson(json);

@override final  String id;
@override final  String tournamentId;
@override final  String teamId;
 final  List<String> _playerIds;
@override@JsonKey() List<String> get playerIds {
  if (_playerIds is EqualUnmodifiableListView) return _playerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playerIds);
}

@override final  String status;

/// Create a copy of EntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryModelCopyWith<_EntryModel> get copyWith => __$EntryModelCopyWithImpl<_EntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&const DeepCollectionEquality().equals(other._playerIds, _playerIds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tournamentId,teamId,const DeepCollectionEquality().hash(_playerIds),status);

@override
String toString() {
  return 'EntryModel(id: $id, tournamentId: $tournamentId, teamId: $teamId, playerIds: $playerIds, status: $status)';
}


}

/// @nodoc
abstract mixin class _$EntryModelCopyWith<$Res> implements $EntryModelCopyWith<$Res> {
  factory _$EntryModelCopyWith(_EntryModel value, $Res Function(_EntryModel) _then) = __$EntryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String tournamentId, String teamId, List<String> playerIds, String status
});




}
/// @nodoc
class __$EntryModelCopyWithImpl<$Res>
    implements _$EntryModelCopyWith<$Res> {
  __$EntryModelCopyWithImpl(this._self, this._then);

  final _EntryModel _self;
  final $Res Function(_EntryModel) _then;

/// Create a copy of EntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tournamentId = null,Object? teamId = null,Object? playerIds = null,Object? status = null,}) {
  return _then(_EntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as String,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,playerIds: null == playerIds ? _self._playerIds : playerIds // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
