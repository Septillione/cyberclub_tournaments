// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeamModel {

 String get id; String get name; String get tag; String? get avatarUrl; String? get description; String? get socialMedia; List<String>? get gamesList; DateTime? get createdAt; String get ownerId;@JsonKey(name: '_count') Map<String, int>? get count; List<TeamMemberModel> get members; List<TeamEntryModel> get entries; bool get isBanned; TeamStatsModel get stats;
/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamModelCopyWith<TeamModel> get copyWith => _$TeamModelCopyWithImpl<TeamModel>(this as TeamModel, _$identity);

  /// Serializes this TeamModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.socialMedia, socialMedia) || other.socialMedia == socialMedia)&&const DeepCollectionEquality().equals(other.gamesList, gamesList)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other.count, count)&&const DeepCollectionEquality().equals(other.members, members)&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl,description,socialMedia,const DeepCollectionEquality().hash(gamesList),createdAt,ownerId,const DeepCollectionEquality().hash(count),const DeepCollectionEquality().hash(members),const DeepCollectionEquality().hash(entries),isBanned,stats);

@override
String toString() {
  return 'TeamModel(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl, description: $description, socialMedia: $socialMedia, gamesList: $gamesList, createdAt: $createdAt, ownerId: $ownerId, count: $count, members: $members, entries: $entries, isBanned: $isBanned, stats: $stats)';
}


}

/// @nodoc
abstract mixin class $TeamModelCopyWith<$Res>  {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) _then) = _$TeamModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String tag, String? avatarUrl, String? description, String? socialMedia, List<String>? gamesList, DateTime? createdAt, String ownerId,@JsonKey(name: '_count') Map<String, int>? count, List<TeamMemberModel> members, List<TeamEntryModel> entries, bool isBanned, TeamStatsModel stats
});


$TeamStatsModelCopyWith<$Res> get stats;

}
/// @nodoc
class _$TeamModelCopyWithImpl<$Res>
    implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._self, this._then);

  final TeamModel _self;
  final $Res Function(TeamModel) _then;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tag = null,Object? avatarUrl = freezed,Object? description = freezed,Object? socialMedia = freezed,Object? gamesList = freezed,Object? createdAt = freezed,Object? ownerId = null,Object? count = freezed,Object? members = null,Object? entries = null,Object? isBanned = null,Object? stats = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,socialMedia: freezed == socialMedia ? _self.socialMedia : socialMedia // ignore: cast_nullable_to_non_nullable
as String?,gamesList: freezed == gamesList ? _self.gamesList : gamesList // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<TeamMemberModel>,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<TeamEntryModel>,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as TeamStatsModel,
  ));
}
/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamStatsModelCopyWith<$Res> get stats {
  
  return $TeamStatsModelCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeamModel].
extension TeamModelPatterns on TeamModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String tag,  String? avatarUrl,  String? description,  String? socialMedia,  List<String>? gamesList,  DateTime? createdAt,  String ownerId, @JsonKey(name: '_count')  Map<String, int>? count,  List<TeamMemberModel> members,  List<TeamEntryModel> entries,  bool isBanned,  TeamStatsModel stats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.description,_that.socialMedia,_that.gamesList,_that.createdAt,_that.ownerId,_that.count,_that.members,_that.entries,_that.isBanned,_that.stats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String tag,  String? avatarUrl,  String? description,  String? socialMedia,  List<String>? gamesList,  DateTime? createdAt,  String ownerId, @JsonKey(name: '_count')  Map<String, int>? count,  List<TeamMemberModel> members,  List<TeamEntryModel> entries,  bool isBanned,  TeamStatsModel stats)  $default,) {final _that = this;
switch (_that) {
case _TeamModel():
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.description,_that.socialMedia,_that.gamesList,_that.createdAt,_that.ownerId,_that.count,_that.members,_that.entries,_that.isBanned,_that.stats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String tag,  String? avatarUrl,  String? description,  String? socialMedia,  List<String>? gamesList,  DateTime? createdAt,  String ownerId, @JsonKey(name: '_count')  Map<String, int>? count,  List<TeamMemberModel> members,  List<TeamEntryModel> entries,  bool isBanned,  TeamStatsModel stats)?  $default,) {final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.description,_that.socialMedia,_that.gamesList,_that.createdAt,_that.ownerId,_that.count,_that.members,_that.entries,_that.isBanned,_that.stats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamModel implements TeamModel {
  const _TeamModel({required this.id, required this.name, required this.tag, this.avatarUrl, this.description, this.socialMedia, final  List<String>? gamesList = const [], this.createdAt, required this.ownerId, @JsonKey(name: '_count') final  Map<String, int>? count, final  List<TeamMemberModel> members = const [], final  List<TeamEntryModel> entries = const [], this.isBanned = false, this.stats = const TeamStatsModel()}): _gamesList = gamesList,_count = count,_members = members,_entries = entries;
  factory _TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String tag;
@override final  String? avatarUrl;
@override final  String? description;
@override final  String? socialMedia;
 final  List<String>? _gamesList;
@override@JsonKey() List<String>? get gamesList {
  final value = _gamesList;
  if (value == null) return null;
  if (_gamesList is EqualUnmodifiableListView) return _gamesList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? createdAt;
@override final  String ownerId;
 final  Map<String, int>? _count;
@override@JsonKey(name: '_count') Map<String, int>? get count {
  final value = _count;
  if (value == null) return null;
  if (_count is EqualUnmodifiableMapView) return _count;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<TeamMemberModel> _members;
@override@JsonKey() List<TeamMemberModel> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}

 final  List<TeamEntryModel> _entries;
@override@JsonKey() List<TeamEntryModel> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey() final  bool isBanned;
@override@JsonKey() final  TeamStatsModel stats;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamModelCopyWith<_TeamModel> get copyWith => __$TeamModelCopyWithImpl<_TeamModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.socialMedia, socialMedia) || other.socialMedia == socialMedia)&&const DeepCollectionEquality().equals(other._gamesList, _gamesList)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other._count, _count)&&const DeepCollectionEquality().equals(other._members, _members)&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl,description,socialMedia,const DeepCollectionEquality().hash(_gamesList),createdAt,ownerId,const DeepCollectionEquality().hash(_count),const DeepCollectionEquality().hash(_members),const DeepCollectionEquality().hash(_entries),isBanned,stats);

@override
String toString() {
  return 'TeamModel(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl, description: $description, socialMedia: $socialMedia, gamesList: $gamesList, createdAt: $createdAt, ownerId: $ownerId, count: $count, members: $members, entries: $entries, isBanned: $isBanned, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$TeamModelCopyWith<$Res> implements $TeamModelCopyWith<$Res> {
  factory _$TeamModelCopyWith(_TeamModel value, $Res Function(_TeamModel) _then) = __$TeamModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String tag, String? avatarUrl, String? description, String? socialMedia, List<String>? gamesList, DateTime? createdAt, String ownerId,@JsonKey(name: '_count') Map<String, int>? count, List<TeamMemberModel> members, List<TeamEntryModel> entries, bool isBanned, TeamStatsModel stats
});


@override $TeamStatsModelCopyWith<$Res> get stats;

}
/// @nodoc
class __$TeamModelCopyWithImpl<$Res>
    implements _$TeamModelCopyWith<$Res> {
  __$TeamModelCopyWithImpl(this._self, this._then);

  final _TeamModel _self;
  final $Res Function(_TeamModel) _then;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tag = null,Object? avatarUrl = freezed,Object? description = freezed,Object? socialMedia = freezed,Object? gamesList = freezed,Object? createdAt = freezed,Object? ownerId = null,Object? count = freezed,Object? members = null,Object? entries = null,Object? isBanned = null,Object? stats = null,}) {
  return _then(_TeamModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,socialMedia: freezed == socialMedia ? _self.socialMedia : socialMedia // ignore: cast_nullable_to_non_nullable
as String?,gamesList: freezed == gamesList ? _self._gamesList : gamesList // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self._count : count // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<TeamMemberModel>,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<TeamEntryModel>,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as TeamStatsModel,
  ));
}

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamStatsModelCopyWith<$Res> get stats {
  
  return $TeamStatsModelCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$TeamUserShortModel {

 String get id; String get nickname; String? get avatarUrl; bool get isBanned;
/// Create a copy of TeamUserShortModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamUserShortModelCopyWith<TeamUserShortModel> get copyWith => _$TeamUserShortModelCopyWithImpl<TeamUserShortModel>(this as TeamUserShortModel, _$identity);

  /// Serializes this TeamUserShortModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamUserShortModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,avatarUrl,isBanned);

@override
String toString() {
  return 'TeamUserShortModel(id: $id, nickname: $nickname, avatarUrl: $avatarUrl, isBanned: $isBanned)';
}


}

/// @nodoc
abstract mixin class $TeamUserShortModelCopyWith<$Res>  {
  factory $TeamUserShortModelCopyWith(TeamUserShortModel value, $Res Function(TeamUserShortModel) _then) = _$TeamUserShortModelCopyWithImpl;
@useResult
$Res call({
 String id, String nickname, String? avatarUrl, bool isBanned
});




}
/// @nodoc
class _$TeamUserShortModelCopyWithImpl<$Res>
    implements $TeamUserShortModelCopyWith<$Res> {
  _$TeamUserShortModelCopyWithImpl(this._self, this._then);

  final TeamUserShortModel _self;
  final $Res Function(TeamUserShortModel) _then;

/// Create a copy of TeamUserShortModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nickname = null,Object? avatarUrl = freezed,Object? isBanned = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamUserShortModel].
extension TeamUserShortModelPatterns on TeamUserShortModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamUserShortModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamUserShortModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamUserShortModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamUserShortModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamUserShortModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamUserShortModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nickname,  String? avatarUrl,  bool isBanned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamUserShortModel() when $default != null:
return $default(_that.id,_that.nickname,_that.avatarUrl,_that.isBanned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nickname,  String? avatarUrl,  bool isBanned)  $default,) {final _that = this;
switch (_that) {
case _TeamUserShortModel():
return $default(_that.id,_that.nickname,_that.avatarUrl,_that.isBanned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nickname,  String? avatarUrl,  bool isBanned)?  $default,) {final _that = this;
switch (_that) {
case _TeamUserShortModel() when $default != null:
return $default(_that.id,_that.nickname,_that.avatarUrl,_that.isBanned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamUserShortModel implements TeamUserShortModel {
  const _TeamUserShortModel({required this.id, required this.nickname, this.avatarUrl, this.isBanned = false});
  factory _TeamUserShortModel.fromJson(Map<String, dynamic> json) => _$TeamUserShortModelFromJson(json);

@override final  String id;
@override final  String nickname;
@override final  String? avatarUrl;
@override@JsonKey() final  bool isBanned;

/// Create a copy of TeamUserShortModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamUserShortModelCopyWith<_TeamUserShortModel> get copyWith => __$TeamUserShortModelCopyWithImpl<_TeamUserShortModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamUserShortModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamUserShortModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,avatarUrl,isBanned);

@override
String toString() {
  return 'TeamUserShortModel(id: $id, nickname: $nickname, avatarUrl: $avatarUrl, isBanned: $isBanned)';
}


}

/// @nodoc
abstract mixin class _$TeamUserShortModelCopyWith<$Res> implements $TeamUserShortModelCopyWith<$Res> {
  factory _$TeamUserShortModelCopyWith(_TeamUserShortModel value, $Res Function(_TeamUserShortModel) _then) = __$TeamUserShortModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String nickname, String? avatarUrl, bool isBanned
});




}
/// @nodoc
class __$TeamUserShortModelCopyWithImpl<$Res>
    implements _$TeamUserShortModelCopyWith<$Res> {
  __$TeamUserShortModelCopyWithImpl(this._self, this._then);

  final _TeamUserShortModel _self;
  final $Res Function(_TeamUserShortModel) _then;

/// Create a copy of TeamUserShortModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nickname = null,Object? avatarUrl = freezed,Object? isBanned = null,}) {
  return _then(_TeamUserShortModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$TeamMemberModel {

 String get id; String get userId; String get teamId; TeamUserShortModel get user;
/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamMemberModelCopyWith<TeamMemberModel> get copyWith => _$TeamMemberModelCopyWithImpl<TeamMemberModel>(this as TeamMemberModel, _$identity);

  /// Serializes this TeamMemberModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMemberModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,teamId,user);

@override
String toString() {
  return 'TeamMemberModel(id: $id, userId: $userId, teamId: $teamId, user: $user)';
}


}

/// @nodoc
abstract mixin class $TeamMemberModelCopyWith<$Res>  {
  factory $TeamMemberModelCopyWith(TeamMemberModel value, $Res Function(TeamMemberModel) _then) = _$TeamMemberModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String teamId, TeamUserShortModel user
});


$TeamUserShortModelCopyWith<$Res> get user;

}
/// @nodoc
class _$TeamMemberModelCopyWithImpl<$Res>
    implements $TeamMemberModelCopyWith<$Res> {
  _$TeamMemberModelCopyWithImpl(this._self, this._then);

  final TeamMemberModel _self;
  final $Res Function(TeamMemberModel) _then;

/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? teamId = null,Object? user = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TeamUserShortModel,
  ));
}
/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamUserShortModelCopyWith<$Res> get user {
  
  return $TeamUserShortModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeamMemberModel].
extension TeamMemberModelPatterns on TeamMemberModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamMemberModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamMemberModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamMemberModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamMemberModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamMemberModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamMemberModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String teamId,  TeamUserShortModel user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamMemberModel() when $default != null:
return $default(_that.id,_that.userId,_that.teamId,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String teamId,  TeamUserShortModel user)  $default,) {final _that = this;
switch (_that) {
case _TeamMemberModel():
return $default(_that.id,_that.userId,_that.teamId,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String teamId,  TeamUserShortModel user)?  $default,) {final _that = this;
switch (_that) {
case _TeamMemberModel() when $default != null:
return $default(_that.id,_that.userId,_that.teamId,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamMemberModel implements TeamMemberModel {
  const _TeamMemberModel({required this.id, required this.userId, required this.teamId, required this.user});
  factory _TeamMemberModel.fromJson(Map<String, dynamic> json) => _$TeamMemberModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String teamId;
@override final  TeamUserShortModel user;

/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamMemberModelCopyWith<_TeamMemberModel> get copyWith => __$TeamMemberModelCopyWithImpl<_TeamMemberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamMemberModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamMemberModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,teamId,user);

@override
String toString() {
  return 'TeamMemberModel(id: $id, userId: $userId, teamId: $teamId, user: $user)';
}


}

/// @nodoc
abstract mixin class _$TeamMemberModelCopyWith<$Res> implements $TeamMemberModelCopyWith<$Res> {
  factory _$TeamMemberModelCopyWith(_TeamMemberModel value, $Res Function(_TeamMemberModel) _then) = __$TeamMemberModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String teamId, TeamUserShortModel user
});


@override $TeamUserShortModelCopyWith<$Res> get user;

}
/// @nodoc
class __$TeamMemberModelCopyWithImpl<$Res>
    implements _$TeamMemberModelCopyWith<$Res> {
  __$TeamMemberModelCopyWithImpl(this._self, this._then);

  final _TeamMemberModel _self;
  final $Res Function(_TeamMemberModel) _then;

/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? teamId = null,Object? user = null,}) {
  return _then(_TeamMemberModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,teamId: null == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TeamUserShortModel,
  ));
}

/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamUserShortModelCopyWith<$Res> get user {
  
  return $TeamUserShortModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$TeamEntryModel {

 String get id; String get status; TournamentModel get tournament;
/// Create a copy of TeamEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamEntryModelCopyWith<TeamEntryModel> get copyWith => _$TeamEntryModelCopyWithImpl<TeamEntryModel>(this as TeamEntryModel, _$identity);

  /// Serializes this TeamEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.tournament, tournament) || other.tournament == tournament));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,tournament);

@override
String toString() {
  return 'TeamEntryModel(id: $id, status: $status, tournament: $tournament)';
}


}

/// @nodoc
abstract mixin class $TeamEntryModelCopyWith<$Res>  {
  factory $TeamEntryModelCopyWith(TeamEntryModel value, $Res Function(TeamEntryModel) _then) = _$TeamEntryModelCopyWithImpl;
@useResult
$Res call({
 String id, String status, TournamentModel tournament
});


$TournamentModelCopyWith<$Res> get tournament;

}
/// @nodoc
class _$TeamEntryModelCopyWithImpl<$Res>
    implements $TeamEntryModelCopyWith<$Res> {
  _$TeamEntryModelCopyWithImpl(this._self, this._then);

  final TeamEntryModel _self;
  final $Res Function(TeamEntryModel) _then;

/// Create a copy of TeamEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? tournament = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tournament: null == tournament ? _self.tournament : tournament // ignore: cast_nullable_to_non_nullable
as TournamentModel,
  ));
}
/// Create a copy of TeamEntryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TournamentModelCopyWith<$Res> get tournament {
  
  return $TournamentModelCopyWith<$Res>(_self.tournament, (value) {
    return _then(_self.copyWith(tournament: value));
  });
}
}


/// Adds pattern-matching-related methods to [TeamEntryModel].
extension TeamEntryModelPatterns on TeamEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  TournamentModel tournament)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamEntryModel() when $default != null:
return $default(_that.id,_that.status,_that.tournament);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  TournamentModel tournament)  $default,) {final _that = this;
switch (_that) {
case _TeamEntryModel():
return $default(_that.id,_that.status,_that.tournament);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  TournamentModel tournament)?  $default,) {final _that = this;
switch (_that) {
case _TeamEntryModel() when $default != null:
return $default(_that.id,_that.status,_that.tournament);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamEntryModel implements TeamEntryModel {
  const _TeamEntryModel({required this.id, required this.status, required this.tournament});
  factory _TeamEntryModel.fromJson(Map<String, dynamic> json) => _$TeamEntryModelFromJson(json);

@override final  String id;
@override final  String status;
@override final  TournamentModel tournament;

/// Create a copy of TeamEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamEntryModelCopyWith<_TeamEntryModel> get copyWith => __$TeamEntryModelCopyWithImpl<_TeamEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.tournament, tournament) || other.tournament == tournament));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,tournament);

@override
String toString() {
  return 'TeamEntryModel(id: $id, status: $status, tournament: $tournament)';
}


}

/// @nodoc
abstract mixin class _$TeamEntryModelCopyWith<$Res> implements $TeamEntryModelCopyWith<$Res> {
  factory _$TeamEntryModelCopyWith(_TeamEntryModel value, $Res Function(_TeamEntryModel) _then) = __$TeamEntryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, TournamentModel tournament
});


@override $TournamentModelCopyWith<$Res> get tournament;

}
/// @nodoc
class __$TeamEntryModelCopyWithImpl<$Res>
    implements _$TeamEntryModelCopyWith<$Res> {
  __$TeamEntryModelCopyWithImpl(this._self, this._then);

  final _TeamEntryModel _self;
  final $Res Function(_TeamEntryModel) _then;

/// Create a copy of TeamEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? tournament = null,}) {
  return _then(_TeamEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tournament: null == tournament ? _self.tournament : tournament // ignore: cast_nullable_to_non_nullable
as TournamentModel,
  ));
}

/// Create a copy of TeamEntryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TournamentModelCopyWith<$Res> get tournament {
  
  return $TournamentModelCopyWith<$Res>(_self.tournament, (value) {
    return _then(_self.copyWith(tournament: value));
  });
}
}


/// @nodoc
mixin _$TeamStatsModel {

 int get tournamentsPlayed; int get tournamentsWon; double get winrate;
/// Create a copy of TeamStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamStatsModelCopyWith<TeamStatsModel> get copyWith => _$TeamStatsModelCopyWithImpl<TeamStatsModel>(this as TeamStatsModel, _$identity);

  /// Serializes this TeamStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamStatsModel&&(identical(other.tournamentsPlayed, tournamentsPlayed) || other.tournamentsPlayed == tournamentsPlayed)&&(identical(other.tournamentsWon, tournamentsWon) || other.tournamentsWon == tournamentsWon)&&(identical(other.winrate, winrate) || other.winrate == winrate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tournamentsPlayed,tournamentsWon,winrate);

@override
String toString() {
  return 'TeamStatsModel(tournamentsPlayed: $tournamentsPlayed, tournamentsWon: $tournamentsWon, winrate: $winrate)';
}


}

/// @nodoc
abstract mixin class $TeamStatsModelCopyWith<$Res>  {
  factory $TeamStatsModelCopyWith(TeamStatsModel value, $Res Function(TeamStatsModel) _then) = _$TeamStatsModelCopyWithImpl;
@useResult
$Res call({
 int tournamentsPlayed, int tournamentsWon, double winrate
});




}
/// @nodoc
class _$TeamStatsModelCopyWithImpl<$Res>
    implements $TeamStatsModelCopyWith<$Res> {
  _$TeamStatsModelCopyWithImpl(this._self, this._then);

  final TeamStatsModel _self;
  final $Res Function(TeamStatsModel) _then;

/// Create a copy of TeamStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tournamentsPlayed = null,Object? tournamentsWon = null,Object? winrate = null,}) {
  return _then(_self.copyWith(
tournamentsPlayed: null == tournamentsPlayed ? _self.tournamentsPlayed : tournamentsPlayed // ignore: cast_nullable_to_non_nullable
as int,tournamentsWon: null == tournamentsWon ? _self.tournamentsWon : tournamentsWon // ignore: cast_nullable_to_non_nullable
as int,winrate: null == winrate ? _self.winrate : winrate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamStatsModel].
extension TeamStatsModelPatterns on TeamStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tournamentsPlayed,  int tournamentsWon,  double winrate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamStatsModel() when $default != null:
return $default(_that.tournamentsPlayed,_that.tournamentsWon,_that.winrate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tournamentsPlayed,  int tournamentsWon,  double winrate)  $default,) {final _that = this;
switch (_that) {
case _TeamStatsModel():
return $default(_that.tournamentsPlayed,_that.tournamentsWon,_that.winrate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tournamentsPlayed,  int tournamentsWon,  double winrate)?  $default,) {final _that = this;
switch (_that) {
case _TeamStatsModel() when $default != null:
return $default(_that.tournamentsPlayed,_that.tournamentsWon,_that.winrate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamStatsModel implements TeamStatsModel {
  const _TeamStatsModel({this.tournamentsPlayed = 0, this.tournamentsWon = 0, this.winrate = 0.0});
  factory _TeamStatsModel.fromJson(Map<String, dynamic> json) => _$TeamStatsModelFromJson(json);

@override@JsonKey() final  int tournamentsPlayed;
@override@JsonKey() final  int tournamentsWon;
@override@JsonKey() final  double winrate;

/// Create a copy of TeamStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamStatsModelCopyWith<_TeamStatsModel> get copyWith => __$TeamStatsModelCopyWithImpl<_TeamStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamStatsModel&&(identical(other.tournamentsPlayed, tournamentsPlayed) || other.tournamentsPlayed == tournamentsPlayed)&&(identical(other.tournamentsWon, tournamentsWon) || other.tournamentsWon == tournamentsWon)&&(identical(other.winrate, winrate) || other.winrate == winrate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tournamentsPlayed,tournamentsWon,winrate);

@override
String toString() {
  return 'TeamStatsModel(tournamentsPlayed: $tournamentsPlayed, tournamentsWon: $tournamentsWon, winrate: $winrate)';
}


}

/// @nodoc
abstract mixin class _$TeamStatsModelCopyWith<$Res> implements $TeamStatsModelCopyWith<$Res> {
  factory _$TeamStatsModelCopyWith(_TeamStatsModel value, $Res Function(_TeamStatsModel) _then) = __$TeamStatsModelCopyWithImpl;
@override @useResult
$Res call({
 int tournamentsPlayed, int tournamentsWon, double winrate
});




}
/// @nodoc
class __$TeamStatsModelCopyWithImpl<$Res>
    implements _$TeamStatsModelCopyWith<$Res> {
  __$TeamStatsModelCopyWithImpl(this._self, this._then);

  final _TeamStatsModel _self;
  final $Res Function(_TeamStatsModel) _then;

/// Create a copy of TeamStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tournamentsPlayed = null,Object? tournamentsWon = null,Object? winrate = null,}) {
  return _then(_TeamStatsModel(
tournamentsPlayed: null == tournamentsPlayed ? _self.tournamentsPlayed : tournamentsPlayed // ignore: cast_nullable_to_non_nullable
as int,tournamentsWon: null == tournamentsWon ? _self.tournamentsWon : tournamentsWon // ignore: cast_nullable_to_non_nullable
as int,winrate: null == winrate ? _self.winrate : winrate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$TeamShortInfoModel {

 String get id; String get name; String get tag; String? get avatarUrl;
/// Create a copy of TeamShortInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamShortInfoModelCopyWith<TeamShortInfoModel> get copyWith => _$TeamShortInfoModelCopyWithImpl<TeamShortInfoModel>(this as TeamShortInfoModel, _$identity);

  /// Serializes this TeamShortInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamShortInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl);

@override
String toString() {
  return 'TeamShortInfoModel(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $TeamShortInfoModelCopyWith<$Res>  {
  factory $TeamShortInfoModelCopyWith(TeamShortInfoModel value, $Res Function(TeamShortInfoModel) _then) = _$TeamShortInfoModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String tag, String? avatarUrl
});




}
/// @nodoc
class _$TeamShortInfoModelCopyWithImpl<$Res>
    implements $TeamShortInfoModelCopyWith<$Res> {
  _$TeamShortInfoModelCopyWithImpl(this._self, this._then);

  final TeamShortInfoModel _self;
  final $Res Function(TeamShortInfoModel) _then;

/// Create a copy of TeamShortInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tag = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamShortInfoModel].
extension TeamShortInfoModelPatterns on TeamShortInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamShortInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamShortInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamShortInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamShortInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamShortInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamShortInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String tag,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamShortInfoModel() when $default != null:
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String tag,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _TeamShortInfoModel():
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String tag,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _TeamShortInfoModel() when $default != null:
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamShortInfoModel implements TeamShortInfoModel {
  const _TeamShortInfoModel({required this.id, required this.name, required this.tag, this.avatarUrl});
  factory _TeamShortInfoModel.fromJson(Map<String, dynamic> json) => _$TeamShortInfoModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String tag;
@override final  String? avatarUrl;

/// Create a copy of TeamShortInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamShortInfoModelCopyWith<_TeamShortInfoModel> get copyWith => __$TeamShortInfoModelCopyWithImpl<_TeamShortInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamShortInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamShortInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl);

@override
String toString() {
  return 'TeamShortInfoModel(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$TeamShortInfoModelCopyWith<$Res> implements $TeamShortInfoModelCopyWith<$Res> {
  factory _$TeamShortInfoModelCopyWith(_TeamShortInfoModel value, $Res Function(_TeamShortInfoModel) _then) = __$TeamShortInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String tag, String? avatarUrl
});




}
/// @nodoc
class __$TeamShortInfoModelCopyWithImpl<$Res>
    implements _$TeamShortInfoModelCopyWith<$Res> {
  __$TeamShortInfoModelCopyWithImpl(this._self, this._then);

  final _TeamShortInfoModel _self;
  final $Res Function(_TeamShortInfoModel) _then;

/// Create a copy of TeamShortInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tag = null,Object? avatarUrl = freezed,}) {
  return _then(_TeamShortInfoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
