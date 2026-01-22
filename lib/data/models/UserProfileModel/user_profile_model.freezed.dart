// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileModel {

 String get id; String get nickname; String get email; UserRole get role; String? get avatarUrl; String? get bio; List<UserEntryModel> get entries; bool get isBanned;
/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileModelCopyWith<UserProfileModel> get copyWith => _$UserProfileModelCopyWithImpl<UserProfileModel>(this as UserProfileModel, _$identity);

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,email,role,avatarUrl,bio,const DeepCollectionEquality().hash(entries),isBanned);

@override
String toString() {
  return 'UserProfileModel(id: $id, nickname: $nickname, email: $email, role: $role, avatarUrl: $avatarUrl, bio: $bio, entries: $entries, isBanned: $isBanned)';
}


}

/// @nodoc
abstract mixin class $UserProfileModelCopyWith<$Res>  {
  factory $UserProfileModelCopyWith(UserProfileModel value, $Res Function(UserProfileModel) _then) = _$UserProfileModelCopyWithImpl;
@useResult
$Res call({
 String id, String nickname, String email, UserRole role, String? avatarUrl, String? bio, List<UserEntryModel> entries, bool isBanned
});




}
/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._self, this._then);

  final UserProfileModel _self;
  final $Res Function(UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nickname = null,Object? email = null,Object? role = null,Object? avatarUrl = freezed,Object? bio = freezed,Object? entries = null,Object? isBanned = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<UserEntryModel>,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileModel].
extension UserProfileModelPatterns on UserProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nickname,  String email,  UserRole role,  String? avatarUrl,  String? bio,  List<UserEntryModel> entries,  bool isBanned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that.id,_that.nickname,_that.email,_that.role,_that.avatarUrl,_that.bio,_that.entries,_that.isBanned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nickname,  String email,  UserRole role,  String? avatarUrl,  String? bio,  List<UserEntryModel> entries,  bool isBanned)  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel():
return $default(_that.id,_that.nickname,_that.email,_that.role,_that.avatarUrl,_that.bio,_that.entries,_that.isBanned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nickname,  String email,  UserRole role,  String? avatarUrl,  String? bio,  List<UserEntryModel> entries,  bool isBanned)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that.id,_that.nickname,_that.email,_that.role,_that.avatarUrl,_that.bio,_that.entries,_that.isBanned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileModel implements UserProfileModel {
  const _UserProfileModel({required this.id, required this.nickname, required this.email, required this.role, this.avatarUrl, required this.bio, final  List<UserEntryModel> entries = const [], this.isBanned = false}): _entries = entries;
  factory _UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);

@override final  String id;
@override final  String nickname;
@override final  String email;
@override final  UserRole role;
@override final  String? avatarUrl;
@override final  String? bio;
 final  List<UserEntryModel> _entries;
@override@JsonKey() List<UserEntryModel> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey() final  bool isBanned;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileModelCopyWith<_UserProfileModel> get copyWith => __$UserProfileModelCopyWithImpl<_UserProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bio, bio) || other.bio == bio)&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.isBanned, isBanned) || other.isBanned == isBanned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nickname,email,role,avatarUrl,bio,const DeepCollectionEquality().hash(_entries),isBanned);

@override
String toString() {
  return 'UserProfileModel(id: $id, nickname: $nickname, email: $email, role: $role, avatarUrl: $avatarUrl, bio: $bio, entries: $entries, isBanned: $isBanned)';
}


}

/// @nodoc
abstract mixin class _$UserProfileModelCopyWith<$Res> implements $UserProfileModelCopyWith<$Res> {
  factory _$UserProfileModelCopyWith(_UserProfileModel value, $Res Function(_UserProfileModel) _then) = __$UserProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String nickname, String email, UserRole role, String? avatarUrl, String? bio, List<UserEntryModel> entries, bool isBanned
});




}
/// @nodoc
class __$UserProfileModelCopyWithImpl<$Res>
    implements _$UserProfileModelCopyWith<$Res> {
  __$UserProfileModelCopyWithImpl(this._self, this._then);

  final _UserProfileModel _self;
  final $Res Function(_UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nickname = null,Object? email = null,Object? role = null,Object? avatarUrl = freezed,Object? bio = freezed,Object? entries = null,Object? isBanned = null,}) {
  return _then(_UserProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<UserEntryModel>,isBanned: null == isBanned ? _self.isBanned : isBanned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$UserEntryModel {

 String get id; String get status; TournamentModel get tournament;
/// Create a copy of UserEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntryModelCopyWith<UserEntryModel> get copyWith => _$UserEntryModelCopyWithImpl<UserEntryModel>(this as UserEntryModel, _$identity);

  /// Serializes this UserEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.tournament, tournament) || other.tournament == tournament));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,tournament);

@override
String toString() {
  return 'UserEntryModel(id: $id, status: $status, tournament: $tournament)';
}


}

/// @nodoc
abstract mixin class $UserEntryModelCopyWith<$Res>  {
  factory $UserEntryModelCopyWith(UserEntryModel value, $Res Function(UserEntryModel) _then) = _$UserEntryModelCopyWithImpl;
@useResult
$Res call({
 String id, String status, TournamentModel tournament
});


$TournamentModelCopyWith<$Res> get tournament;

}
/// @nodoc
class _$UserEntryModelCopyWithImpl<$Res>
    implements $UserEntryModelCopyWith<$Res> {
  _$UserEntryModelCopyWithImpl(this._self, this._then);

  final UserEntryModel _self;
  final $Res Function(UserEntryModel) _then;

/// Create a copy of UserEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? tournament = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tournament: null == tournament ? _self.tournament : tournament // ignore: cast_nullable_to_non_nullable
as TournamentModel,
  ));
}
/// Create a copy of UserEntryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TournamentModelCopyWith<$Res> get tournament {
  
  return $TournamentModelCopyWith<$Res>(_self.tournament, (value) {
    return _then(_self.copyWith(tournament: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserEntryModel].
extension UserEntryModelPatterns on UserEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _UserEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserEntryModel() when $default != null:
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
case _UserEntryModel() when $default != null:
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
case _UserEntryModel():
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
case _UserEntryModel() when $default != null:
return $default(_that.id,_that.status,_that.tournament);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserEntryModel implements UserEntryModel {
  const _UserEntryModel({required this.id, required this.status, required this.tournament});
  factory _UserEntryModel.fromJson(Map<String, dynamic> json) => _$UserEntryModelFromJson(json);

@override final  String id;
@override final  String status;
@override final  TournamentModel tournament;

/// Create a copy of UserEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntryModelCopyWith<_UserEntryModel> get copyWith => __$UserEntryModelCopyWithImpl<_UserEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.tournament, tournament) || other.tournament == tournament));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,tournament);

@override
String toString() {
  return 'UserEntryModel(id: $id, status: $status, tournament: $tournament)';
}


}

/// @nodoc
abstract mixin class _$UserEntryModelCopyWith<$Res> implements $UserEntryModelCopyWith<$Res> {
  factory _$UserEntryModelCopyWith(_UserEntryModel value, $Res Function(_UserEntryModel) _then) = __$UserEntryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, TournamentModel tournament
});


@override $TournamentModelCopyWith<$Res> get tournament;

}
/// @nodoc
class __$UserEntryModelCopyWithImpl<$Res>
    implements _$UserEntryModelCopyWith<$Res> {
  __$UserEntryModelCopyWithImpl(this._self, this._then);

  final _UserEntryModel _self;
  final $Res Function(_UserEntryModel) _then;

/// Create a copy of UserEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? tournament = null,}) {
  return _then(_UserEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,tournament: null == tournament ? _self.tournament : tournament // ignore: cast_nullable_to_non_nullable
as TournamentModel,
  ));
}

/// Create a copy of UserEntryModel
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
