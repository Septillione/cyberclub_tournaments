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

 String get id; String get name; String get tag; String? get avatarUrl; String? get description; String get ownerId;@JsonKey(name: '_count') Map<String, int>? get count; List<TeamMemberModel> get members; List<TeamEntryModel> get entries;
/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamModelCopyWith<TeamModel> get copyWith => _$TeamModelCopyWithImpl<TeamModel>(this as TeamModel, _$identity);

  /// Serializes this TeamModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other.count, count)&&const DeepCollectionEquality().equals(other.members, members)&&const DeepCollectionEquality().equals(other.entries, entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl,description,ownerId,const DeepCollectionEquality().hash(count),const DeepCollectionEquality().hash(members),const DeepCollectionEquality().hash(entries));

@override
String toString() {
  return 'TeamModel(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl, description: $description, ownerId: $ownerId, count: $count, members: $members, entries: $entries)';
}


}

/// @nodoc
abstract mixin class $TeamModelCopyWith<$Res>  {
  factory $TeamModelCopyWith(TeamModel value, $Res Function(TeamModel) _then) = _$TeamModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String tag, String? avatarUrl, String? description, String ownerId,@JsonKey(name: '_count') Map<String, int>? count, List<TeamMemberModel> members, List<TeamEntryModel> entries
});




}
/// @nodoc
class _$TeamModelCopyWithImpl<$Res>
    implements $TeamModelCopyWith<$Res> {
  _$TeamModelCopyWithImpl(this._self, this._then);

  final TeamModel _self;
  final $Res Function(TeamModel) _then;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tag = null,Object? avatarUrl = freezed,Object? description = freezed,Object? ownerId = null,Object? count = freezed,Object? members = null,Object? entries = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<TeamMemberModel>,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<TeamEntryModel>,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String tag,  String? avatarUrl,  String? description,  String ownerId, @JsonKey(name: '_count')  Map<String, int>? count,  List<TeamMemberModel> members,  List<TeamEntryModel> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.description,_that.ownerId,_that.count,_that.members,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String tag,  String? avatarUrl,  String? description,  String ownerId, @JsonKey(name: '_count')  Map<String, int>? count,  List<TeamMemberModel> members,  List<TeamEntryModel> entries)  $default,) {final _that = this;
switch (_that) {
case _TeamModel():
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.description,_that.ownerId,_that.count,_that.members,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String tag,  String? avatarUrl,  String? description,  String ownerId, @JsonKey(name: '_count')  Map<String, int>? count,  List<TeamMemberModel> members,  List<TeamEntryModel> entries)?  $default,) {final _that = this;
switch (_that) {
case _TeamModel() when $default != null:
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.description,_that.ownerId,_that.count,_that.members,_that.entries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamModel implements TeamModel {
  const _TeamModel({required this.id, required this.name, required this.tag, this.avatarUrl, this.description, required this.ownerId, @JsonKey(name: '_count') final  Map<String, int>? count, final  List<TeamMemberModel> members = const [], final  List<TeamEntryModel> entries = const []}): _count = count,_members = members,_entries = entries;
  factory _TeamModel.fromJson(Map<String, dynamic> json) => _$TeamModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String tag;
@override final  String? avatarUrl;
@override final  String? description;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other._count, _count)&&const DeepCollectionEquality().equals(other._members, _members)&&const DeepCollectionEquality().equals(other._entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl,description,ownerId,const DeepCollectionEquality().hash(_count),const DeepCollectionEquality().hash(_members),const DeepCollectionEquality().hash(_entries));

@override
String toString() {
  return 'TeamModel(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl, description: $description, ownerId: $ownerId, count: $count, members: $members, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$TeamModelCopyWith<$Res> implements $TeamModelCopyWith<$Res> {
  factory _$TeamModelCopyWith(_TeamModel value, $Res Function(_TeamModel) _then) = __$TeamModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String tag, String? avatarUrl, String? description, String ownerId,@JsonKey(name: '_count') Map<String, int>? count, List<TeamMemberModel> members, List<TeamEntryModel> entries
});




}
/// @nodoc
class __$TeamModelCopyWithImpl<$Res>
    implements _$TeamModelCopyWith<$Res> {
  __$TeamModelCopyWithImpl(this._self, this._then);

  final _TeamModel _self;
  final $Res Function(_TeamModel) _then;

/// Create a copy of TeamModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tag = null,Object? avatarUrl = freezed,Object? description = freezed,Object? ownerId = null,Object? count = freezed,Object? members = null,Object? entries = null,}) {
  return _then(_TeamModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,count: freezed == count ? _self._count : count // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<TeamMemberModel>,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<TeamEntryModel>,
  ));
}


}


/// @nodoc
mixin _$TeamMemberModel {

 String get id; String get userId; String get teamId; TeamUserShort get user;
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
 String id, String userId, String teamId, TeamUserShort user
});


$TeamUserShortCopyWith<$Res> get user;

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
as TeamUserShort,
  ));
}
/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamUserShortCopyWith<$Res> get user {
  
  return $TeamUserShortCopyWith<$Res>(_self.user, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String teamId,  TeamUserShort user)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String teamId,  TeamUserShort user)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String teamId,  TeamUserShort user)?  $default,) {final _that = this;
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
@override final  TeamUserShort user;

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
 String id, String userId, String teamId, TeamUserShort user
});


@override $TeamUserShortCopyWith<$Res> get user;

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
as TeamUserShort,
  ));
}

/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamUserShortCopyWith<$Res> get user {
  
  return $TeamUserShortCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$TeamUserShort {

 String get id; String get nickname; String? get avatarUrl;
/// Create a copy of TeamUserShort
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamUserShortCopyWith<TeamUserShort> get copyWith => _$TeamUserShortCopyWithImpl<TeamUserShort>(this as TeamUserShort, _$identity);

  /// Serializes this TeamUserShort to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamUserShort&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,avatarUrl);

@override
String toString() {
  return 'TeamUserShort(id: $id, nickname: $nickname, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $TeamUserShortCopyWith<$Res>  {
  factory $TeamUserShortCopyWith(TeamUserShort value, $Res Function(TeamUserShort) _then) = _$TeamUserShortCopyWithImpl;
@useResult
$Res call({
 String id, String nickname, String? avatarUrl
});




}
/// @nodoc
class _$TeamUserShortCopyWithImpl<$Res>
    implements $TeamUserShortCopyWith<$Res> {
  _$TeamUserShortCopyWithImpl(this._self, this._then);

  final TeamUserShort _self;
  final $Res Function(TeamUserShort) _then;

/// Create a copy of TeamUserShort
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nickname = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamUserShort].
extension TeamUserShortPatterns on TeamUserShort {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamUserShort value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamUserShort() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamUserShort value)  $default,){
final _that = this;
switch (_that) {
case _TeamUserShort():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamUserShort value)?  $default,){
final _that = this;
switch (_that) {
case _TeamUserShort() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nickname,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamUserShort() when $default != null:
return $default(_that.id,_that.nickname,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nickname,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _TeamUserShort():
return $default(_that.id,_that.nickname,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nickname,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _TeamUserShort() when $default != null:
return $default(_that.id,_that.nickname,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamUserShort implements TeamUserShort {
  const _TeamUserShort({required this.id, required this.nickname, this.avatarUrl});
  factory _TeamUserShort.fromJson(Map<String, dynamic> json) => _$TeamUserShortFromJson(json);

@override final  String id;
@override final  String nickname;
@override final  String? avatarUrl;

/// Create a copy of TeamUserShort
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamUserShortCopyWith<_TeamUserShort> get copyWith => __$TeamUserShortCopyWithImpl<_TeamUserShort>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamUserShortToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamUserShort&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,avatarUrl);

@override
String toString() {
  return 'TeamUserShort(id: $id, nickname: $nickname, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$TeamUserShortCopyWith<$Res> implements $TeamUserShortCopyWith<$Res> {
  factory _$TeamUserShortCopyWith(_TeamUserShort value, $Res Function(_TeamUserShort) _then) = __$TeamUserShortCopyWithImpl;
@override @useResult
$Res call({
 String id, String nickname, String? avatarUrl
});




}
/// @nodoc
class __$TeamUserShortCopyWithImpl<$Res>
    implements _$TeamUserShortCopyWith<$Res> {
  __$TeamUserShortCopyWithImpl(this._self, this._then);

  final _TeamUserShort _self;
  final $Res Function(_TeamUserShort) _then;

/// Create a copy of TeamUserShort
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nickname = null,Object? avatarUrl = freezed,}) {
  return _then(_TeamUserShort(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TeamShortInfo {

 String get id; String get name; String get tag; String? get avatarUrl;
/// Create a copy of TeamShortInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamShortInfoCopyWith<TeamShortInfo> get copyWith => _$TeamShortInfoCopyWithImpl<TeamShortInfo>(this as TeamShortInfo, _$identity);

  /// Serializes this TeamShortInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamShortInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl);

@override
String toString() {
  return 'TeamShortInfo(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $TeamShortInfoCopyWith<$Res>  {
  factory $TeamShortInfoCopyWith(TeamShortInfo value, $Res Function(TeamShortInfo) _then) = _$TeamShortInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String tag, String? avatarUrl
});




}
/// @nodoc
class _$TeamShortInfoCopyWithImpl<$Res>
    implements $TeamShortInfoCopyWith<$Res> {
  _$TeamShortInfoCopyWithImpl(this._self, this._then);

  final TeamShortInfo _self;
  final $Res Function(TeamShortInfo) _then;

/// Create a copy of TeamShortInfo
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


/// Adds pattern-matching-related methods to [TeamShortInfo].
extension TeamShortInfoPatterns on TeamShortInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamShortInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamShortInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamShortInfo value)  $default,){
final _that = this;
switch (_that) {
case _TeamShortInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamShortInfo value)?  $default,){
final _that = this;
switch (_that) {
case _TeamShortInfo() when $default != null:
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
case _TeamShortInfo() when $default != null:
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
case _TeamShortInfo():
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
case _TeamShortInfo() when $default != null:
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamShortInfo implements TeamShortInfo {
  const _TeamShortInfo({required this.id, required this.name, required this.tag, this.avatarUrl});
  factory _TeamShortInfo.fromJson(Map<String, dynamic> json) => _$TeamShortInfoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String tag;
@override final  String? avatarUrl;

/// Create a copy of TeamShortInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamShortInfoCopyWith<_TeamShortInfo> get copyWith => __$TeamShortInfoCopyWithImpl<_TeamShortInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamShortInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamShortInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl);

@override
String toString() {
  return 'TeamShortInfo(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$TeamShortInfoCopyWith<$Res> implements $TeamShortInfoCopyWith<$Res> {
  factory _$TeamShortInfoCopyWith(_TeamShortInfo value, $Res Function(_TeamShortInfo) _then) = __$TeamShortInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String tag, String? avatarUrl
});




}
/// @nodoc
class __$TeamShortInfoCopyWithImpl<$Res>
    implements _$TeamShortInfoCopyWith<$Res> {
  __$TeamShortInfoCopyWithImpl(this._self, this._then);

  final _TeamShortInfo _self;
  final $Res Function(_TeamShortInfo) _then;

/// Create a copy of TeamShortInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tag = null,Object? avatarUrl = freezed,}) {
  return _then(_TeamShortInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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

// dart format on
