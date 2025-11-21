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
mixin _$TeammateModel {

 String get id; String get name; String get avatarUrl; bool get isCaptain;
/// Create a copy of TeammateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeammateModelCopyWith<TeammateModel> get copyWith => _$TeammateModelCopyWithImpl<TeammateModel>(this as TeammateModel, _$identity);

  /// Serializes this TeammateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeammateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isCaptain, isCaptain) || other.isCaptain == isCaptain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,isCaptain);

@override
String toString() {
  return 'TeammateModel(id: $id, name: $name, avatarUrl: $avatarUrl, isCaptain: $isCaptain)';
}


}

/// @nodoc
abstract mixin class $TeammateModelCopyWith<$Res>  {
  factory $TeammateModelCopyWith(TeammateModel value, $Res Function(TeammateModel) _then) = _$TeammateModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String avatarUrl, bool isCaptain
});




}
/// @nodoc
class _$TeammateModelCopyWithImpl<$Res>
    implements $TeammateModelCopyWith<$Res> {
  _$TeammateModelCopyWithImpl(this._self, this._then);

  final TeammateModel _self;
  final $Res Function(TeammateModel) _then;

/// Create a copy of TeammateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatarUrl = null,Object? isCaptain = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,isCaptain: null == isCaptain ? _self.isCaptain : isCaptain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TeammateModel].
extension TeammateModelPatterns on TeammateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeammateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeammateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeammateModel value)  $default,){
final _that = this;
switch (_that) {
case _TeammateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeammateModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeammateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String avatarUrl,  bool isCaptain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeammateModel() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.isCaptain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String avatarUrl,  bool isCaptain)  $default,) {final _that = this;
switch (_that) {
case _TeammateModel():
return $default(_that.id,_that.name,_that.avatarUrl,_that.isCaptain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String avatarUrl,  bool isCaptain)?  $default,) {final _that = this;
switch (_that) {
case _TeammateModel() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl,_that.isCaptain);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeammateModel implements TeammateModel {
  const _TeammateModel({required this.id, required this.name, required this.avatarUrl, this.isCaptain = false});
  factory _TeammateModel.fromJson(Map<String, dynamic> json) => _$TeammateModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String avatarUrl;
@override@JsonKey() final  bool isCaptain;

/// Create a copy of TeammateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeammateModelCopyWith<_TeammateModel> get copyWith => __$TeammateModelCopyWithImpl<_TeammateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeammateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeammateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isCaptain, isCaptain) || other.isCaptain == isCaptain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl,isCaptain);

@override
String toString() {
  return 'TeammateModel(id: $id, name: $name, avatarUrl: $avatarUrl, isCaptain: $isCaptain)';
}


}

/// @nodoc
abstract mixin class _$TeammateModelCopyWith<$Res> implements $TeammateModelCopyWith<$Res> {
  factory _$TeammateModelCopyWith(_TeammateModel value, $Res Function(_TeammateModel) _then) = __$TeammateModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String avatarUrl, bool isCaptain
});




}
/// @nodoc
class __$TeammateModelCopyWithImpl<$Res>
    implements _$TeammateModelCopyWith<$Res> {
  __$TeammateModelCopyWithImpl(this._self, this._then);

  final _TeammateModel _self;
  final $Res Function(_TeammateModel) _then;

/// Create a copy of TeammateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatarUrl = null,Object? isCaptain = null,}) {
  return _then(_TeammateModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,isCaptain: null == isCaptain ? _self.isCaptain : isCaptain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$TeamApplicationModel {

 String get id; String get playerName; String get playerAvatarUrl;
/// Create a copy of TeamApplicationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamApplicationModelCopyWith<TeamApplicationModel> get copyWith => _$TeamApplicationModelCopyWithImpl<TeamApplicationModel>(this as TeamApplicationModel, _$identity);

  /// Serializes this TeamApplicationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.playerName, playerName) || other.playerName == playerName)&&(identical(other.playerAvatarUrl, playerAvatarUrl) || other.playerAvatarUrl == playerAvatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,playerName,playerAvatarUrl);

@override
String toString() {
  return 'TeamApplicationModel(id: $id, playerName: $playerName, playerAvatarUrl: $playerAvatarUrl)';
}


}

/// @nodoc
abstract mixin class $TeamApplicationModelCopyWith<$Res>  {
  factory $TeamApplicationModelCopyWith(TeamApplicationModel value, $Res Function(TeamApplicationModel) _then) = _$TeamApplicationModelCopyWithImpl;
@useResult
$Res call({
 String id, String playerName, String playerAvatarUrl
});




}
/// @nodoc
class _$TeamApplicationModelCopyWithImpl<$Res>
    implements $TeamApplicationModelCopyWith<$Res> {
  _$TeamApplicationModelCopyWithImpl(this._self, this._then);

  final TeamApplicationModel _self;
  final $Res Function(TeamApplicationModel) _then;

/// Create a copy of TeamApplicationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? playerName = null,Object? playerAvatarUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,playerName: null == playerName ? _self.playerName : playerName // ignore: cast_nullable_to_non_nullable
as String,playerAvatarUrl: null == playerAvatarUrl ? _self.playerAvatarUrl : playerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamApplicationModel].
extension TeamApplicationModelPatterns on TeamApplicationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamApplicationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamApplicationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamApplicationModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamApplicationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamApplicationModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamApplicationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String playerName,  String playerAvatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamApplicationModel() when $default != null:
return $default(_that.id,_that.playerName,_that.playerAvatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String playerName,  String playerAvatarUrl)  $default,) {final _that = this;
switch (_that) {
case _TeamApplicationModel():
return $default(_that.id,_that.playerName,_that.playerAvatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String playerName,  String playerAvatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _TeamApplicationModel() when $default != null:
return $default(_that.id,_that.playerName,_that.playerAvatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamApplicationModel implements TeamApplicationModel {
  const _TeamApplicationModel({required this.id, required this.playerName, required this.playerAvatarUrl});
  factory _TeamApplicationModel.fromJson(Map<String, dynamic> json) => _$TeamApplicationModelFromJson(json);

@override final  String id;
@override final  String playerName;
@override final  String playerAvatarUrl;

/// Create a copy of TeamApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamApplicationModelCopyWith<_TeamApplicationModel> get copyWith => __$TeamApplicationModelCopyWithImpl<_TeamApplicationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamApplicationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.playerName, playerName) || other.playerName == playerName)&&(identical(other.playerAvatarUrl, playerAvatarUrl) || other.playerAvatarUrl == playerAvatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,playerName,playerAvatarUrl);

@override
String toString() {
  return 'TeamApplicationModel(id: $id, playerName: $playerName, playerAvatarUrl: $playerAvatarUrl)';
}


}

/// @nodoc
abstract mixin class _$TeamApplicationModelCopyWith<$Res> implements $TeamApplicationModelCopyWith<$Res> {
  factory _$TeamApplicationModelCopyWith(_TeamApplicationModel value, $Res Function(_TeamApplicationModel) _then) = __$TeamApplicationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String playerName, String playerAvatarUrl
});




}
/// @nodoc
class __$TeamApplicationModelCopyWithImpl<$Res>
    implements _$TeamApplicationModelCopyWith<$Res> {
  __$TeamApplicationModelCopyWithImpl(this._self, this._then);

  final _TeamApplicationModel _self;
  final $Res Function(_TeamApplicationModel) _then;

/// Create a copy of TeamApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? playerName = null,Object? playerAvatarUrl = null,}) {
  return _then(_TeamApplicationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,playerName: null == playerName ? _self.playerName : playerName // ignore: cast_nullable_to_non_nullable
as String,playerAvatarUrl: null == playerAvatarUrl ? _self.playerAvatarUrl : playerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TeamListItemModel {

 String get id; String get name; String get tag; String get avatarUrl; bool get isCurrentUserCaptain; int get teammatesCount; List<String> get teammatesAvatarUrls;
/// Create a copy of TeamListItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamListItemModelCopyWith<TeamListItemModel> get copyWith => _$TeamListItemModelCopyWithImpl<TeamListItemModel>(this as TeamListItemModel, _$identity);

  /// Serializes this TeamListItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isCurrentUserCaptain, isCurrentUserCaptain) || other.isCurrentUserCaptain == isCurrentUserCaptain)&&(identical(other.teammatesCount, teammatesCount) || other.teammatesCount == teammatesCount)&&const DeepCollectionEquality().equals(other.teammatesAvatarUrls, teammatesAvatarUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl,isCurrentUserCaptain,teammatesCount,const DeepCollectionEquality().hash(teammatesAvatarUrls));

@override
String toString() {
  return 'TeamListItemModel(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl, isCurrentUserCaptain: $isCurrentUserCaptain, teammatesCount: $teammatesCount, teammatesAvatarUrls: $teammatesAvatarUrls)';
}


}

/// @nodoc
abstract mixin class $TeamListItemModelCopyWith<$Res>  {
  factory $TeamListItemModelCopyWith(TeamListItemModel value, $Res Function(TeamListItemModel) _then) = _$TeamListItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String tag, String avatarUrl, bool isCurrentUserCaptain, int teammatesCount, List<String> teammatesAvatarUrls
});




}
/// @nodoc
class _$TeamListItemModelCopyWithImpl<$Res>
    implements $TeamListItemModelCopyWith<$Res> {
  _$TeamListItemModelCopyWithImpl(this._self, this._then);

  final TeamListItemModel _self;
  final $Res Function(TeamListItemModel) _then;

/// Create a copy of TeamListItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tag = null,Object? avatarUrl = null,Object? isCurrentUserCaptain = null,Object? teammatesCount = null,Object? teammatesAvatarUrls = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,isCurrentUserCaptain: null == isCurrentUserCaptain ? _self.isCurrentUserCaptain : isCurrentUserCaptain // ignore: cast_nullable_to_non_nullable
as bool,teammatesCount: null == teammatesCount ? _self.teammatesCount : teammatesCount // ignore: cast_nullable_to_non_nullable
as int,teammatesAvatarUrls: null == teammatesAvatarUrls ? _self.teammatesAvatarUrls : teammatesAvatarUrls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamListItemModel].
extension TeamListItemModelPatterns on TeamListItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamListItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamListItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamListItemModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamListItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamListItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamListItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String tag,  String avatarUrl,  bool isCurrentUserCaptain,  int teammatesCount,  List<String> teammatesAvatarUrls)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamListItemModel() when $default != null:
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.isCurrentUserCaptain,_that.teammatesCount,_that.teammatesAvatarUrls);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String tag,  String avatarUrl,  bool isCurrentUserCaptain,  int teammatesCount,  List<String> teammatesAvatarUrls)  $default,) {final _that = this;
switch (_that) {
case _TeamListItemModel():
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.isCurrentUserCaptain,_that.teammatesCount,_that.teammatesAvatarUrls);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String tag,  String avatarUrl,  bool isCurrentUserCaptain,  int teammatesCount,  List<String> teammatesAvatarUrls)?  $default,) {final _that = this;
switch (_that) {
case _TeamListItemModel() when $default != null:
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.isCurrentUserCaptain,_that.teammatesCount,_that.teammatesAvatarUrls);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamListItemModel implements TeamListItemModel {
  const _TeamListItemModel({required this.id, required this.name, required this.tag, required this.avatarUrl, required this.isCurrentUserCaptain, required this.teammatesCount, final  List<String> teammatesAvatarUrls = const []}): _teammatesAvatarUrls = teammatesAvatarUrls;
  factory _TeamListItemModel.fromJson(Map<String, dynamic> json) => _$TeamListItemModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String tag;
@override final  String avatarUrl;
@override final  bool isCurrentUserCaptain;
@override final  int teammatesCount;
 final  List<String> _teammatesAvatarUrls;
@override@JsonKey() List<String> get teammatesAvatarUrls {
  if (_teammatesAvatarUrls is EqualUnmodifiableListView) return _teammatesAvatarUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teammatesAvatarUrls);
}


/// Create a copy of TeamListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamListItemModelCopyWith<_TeamListItemModel> get copyWith => __$TeamListItemModelCopyWithImpl<_TeamListItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamListItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isCurrentUserCaptain, isCurrentUserCaptain) || other.isCurrentUserCaptain == isCurrentUserCaptain)&&(identical(other.teammatesCount, teammatesCount) || other.teammatesCount == teammatesCount)&&const DeepCollectionEquality().equals(other._teammatesAvatarUrls, _teammatesAvatarUrls));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl,isCurrentUserCaptain,teammatesCount,const DeepCollectionEquality().hash(_teammatesAvatarUrls));

@override
String toString() {
  return 'TeamListItemModel(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl, isCurrentUserCaptain: $isCurrentUserCaptain, teammatesCount: $teammatesCount, teammatesAvatarUrls: $teammatesAvatarUrls)';
}


}

/// @nodoc
abstract mixin class _$TeamListItemModelCopyWith<$Res> implements $TeamListItemModelCopyWith<$Res> {
  factory _$TeamListItemModelCopyWith(_TeamListItemModel value, $Res Function(_TeamListItemModel) _then) = __$TeamListItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String tag, String avatarUrl, bool isCurrentUserCaptain, int teammatesCount, List<String> teammatesAvatarUrls
});




}
/// @nodoc
class __$TeamListItemModelCopyWithImpl<$Res>
    implements _$TeamListItemModelCopyWith<$Res> {
  __$TeamListItemModelCopyWithImpl(this._self, this._then);

  final _TeamListItemModel _self;
  final $Res Function(_TeamListItemModel) _then;

/// Create a copy of TeamListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tag = null,Object? avatarUrl = null,Object? isCurrentUserCaptain = null,Object? teammatesCount = null,Object? teammatesAvatarUrls = null,}) {
  return _then(_TeamListItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,isCurrentUserCaptain: null == isCurrentUserCaptain ? _self.isCurrentUserCaptain : isCurrentUserCaptain // ignore: cast_nullable_to_non_nullable
as bool,teammatesCount: null == teammatesCount ? _self.teammatesCount : teammatesCount // ignore: cast_nullable_to_non_nullable
as int,teammatesAvatarUrls: null == teammatesAvatarUrls ? _self._teammatesAvatarUrls : teammatesAvatarUrls // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$TeamDetailModel {

 String get id; String get name; String get tag; String get avatarUrl; int get tournamentsCount; int get winsCount; double get winrate; bool get isCurrentUserCaptain; String get inviteLink; List<TeammateModel> get teammates; List<TournamentModel> get tournaments; List<TeamApplicationModel> get applications;
/// Create a copy of TeamDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamDetailModelCopyWith<TeamDetailModel> get copyWith => _$TeamDetailModelCopyWithImpl<TeamDetailModel>(this as TeamDetailModel, _$identity);

  /// Serializes this TeamDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.tournamentsCount, tournamentsCount) || other.tournamentsCount == tournamentsCount)&&(identical(other.winsCount, winsCount) || other.winsCount == winsCount)&&(identical(other.winrate, winrate) || other.winrate == winrate)&&(identical(other.isCurrentUserCaptain, isCurrentUserCaptain) || other.isCurrentUserCaptain == isCurrentUserCaptain)&&(identical(other.inviteLink, inviteLink) || other.inviteLink == inviteLink)&&const DeepCollectionEquality().equals(other.teammates, teammates)&&const DeepCollectionEquality().equals(other.tournaments, tournaments)&&const DeepCollectionEquality().equals(other.applications, applications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl,tournamentsCount,winsCount,winrate,isCurrentUserCaptain,inviteLink,const DeepCollectionEquality().hash(teammates),const DeepCollectionEquality().hash(tournaments),const DeepCollectionEquality().hash(applications));

@override
String toString() {
  return 'TeamDetailModel(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl, tournamentsCount: $tournamentsCount, winsCount: $winsCount, winrate: $winrate, isCurrentUserCaptain: $isCurrentUserCaptain, inviteLink: $inviteLink, teammates: $teammates, tournaments: $tournaments, applications: $applications)';
}


}

/// @nodoc
abstract mixin class $TeamDetailModelCopyWith<$Res>  {
  factory $TeamDetailModelCopyWith(TeamDetailModel value, $Res Function(TeamDetailModel) _then) = _$TeamDetailModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String tag, String avatarUrl, int tournamentsCount, int winsCount, double winrate, bool isCurrentUserCaptain, String inviteLink, List<TeammateModel> teammates, List<TournamentModel> tournaments, List<TeamApplicationModel> applications
});




}
/// @nodoc
class _$TeamDetailModelCopyWithImpl<$Res>
    implements $TeamDetailModelCopyWith<$Res> {
  _$TeamDetailModelCopyWithImpl(this._self, this._then);

  final TeamDetailModel _self;
  final $Res Function(TeamDetailModel) _then;

/// Create a copy of TeamDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tag = null,Object? avatarUrl = null,Object? tournamentsCount = null,Object? winsCount = null,Object? winrate = null,Object? isCurrentUserCaptain = null,Object? inviteLink = null,Object? teammates = null,Object? tournaments = null,Object? applications = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,tournamentsCount: null == tournamentsCount ? _self.tournamentsCount : tournamentsCount // ignore: cast_nullable_to_non_nullable
as int,winsCount: null == winsCount ? _self.winsCount : winsCount // ignore: cast_nullable_to_non_nullable
as int,winrate: null == winrate ? _self.winrate : winrate // ignore: cast_nullable_to_non_nullable
as double,isCurrentUserCaptain: null == isCurrentUserCaptain ? _self.isCurrentUserCaptain : isCurrentUserCaptain // ignore: cast_nullable_to_non_nullable
as bool,inviteLink: null == inviteLink ? _self.inviteLink : inviteLink // ignore: cast_nullable_to_non_nullable
as String,teammates: null == teammates ? _self.teammates : teammates // ignore: cast_nullable_to_non_nullable
as List<TeammateModel>,tournaments: null == tournaments ? _self.tournaments : tournaments // ignore: cast_nullable_to_non_nullable
as List<TournamentModel>,applications: null == applications ? _self.applications : applications // ignore: cast_nullable_to_non_nullable
as List<TeamApplicationModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamDetailModel].
extension TeamDetailModelPatterns on TeamDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String tag,  String avatarUrl,  int tournamentsCount,  int winsCount,  double winrate,  bool isCurrentUserCaptain,  String inviteLink,  List<TeammateModel> teammates,  List<TournamentModel> tournaments,  List<TeamApplicationModel> applications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.tournamentsCount,_that.winsCount,_that.winrate,_that.isCurrentUserCaptain,_that.inviteLink,_that.teammates,_that.tournaments,_that.applications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String tag,  String avatarUrl,  int tournamentsCount,  int winsCount,  double winrate,  bool isCurrentUserCaptain,  String inviteLink,  List<TeammateModel> teammates,  List<TournamentModel> tournaments,  List<TeamApplicationModel> applications)  $default,) {final _that = this;
switch (_that) {
case _TeamDetailModel():
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.tournamentsCount,_that.winsCount,_that.winrate,_that.isCurrentUserCaptain,_that.inviteLink,_that.teammates,_that.tournaments,_that.applications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String tag,  String avatarUrl,  int tournamentsCount,  int winsCount,  double winrate,  bool isCurrentUserCaptain,  String inviteLink,  List<TeammateModel> teammates,  List<TournamentModel> tournaments,  List<TeamApplicationModel> applications)?  $default,) {final _that = this;
switch (_that) {
case _TeamDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.tag,_that.avatarUrl,_that.tournamentsCount,_that.winsCount,_that.winrate,_that.isCurrentUserCaptain,_that.inviteLink,_that.teammates,_that.tournaments,_that.applications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamDetailModel implements TeamDetailModel {
  const _TeamDetailModel({required this.id, required this.name, required this.tag, required this.avatarUrl, required this.tournamentsCount, required this.winsCount, required this.winrate, required this.isCurrentUserCaptain, required this.inviteLink, final  List<TeammateModel> teammates = const [], final  List<TournamentModel> tournaments = const [], final  List<TeamApplicationModel> applications = const []}): _teammates = teammates,_tournaments = tournaments,_applications = applications;
  factory _TeamDetailModel.fromJson(Map<String, dynamic> json) => _$TeamDetailModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String tag;
@override final  String avatarUrl;
@override final  int tournamentsCount;
@override final  int winsCount;
@override final  double winrate;
@override final  bool isCurrentUserCaptain;
@override final  String inviteLink;
 final  List<TeammateModel> _teammates;
@override@JsonKey() List<TeammateModel> get teammates {
  if (_teammates is EqualUnmodifiableListView) return _teammates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teammates);
}

 final  List<TournamentModel> _tournaments;
@override@JsonKey() List<TournamentModel> get tournaments {
  if (_tournaments is EqualUnmodifiableListView) return _tournaments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tournaments);
}

 final  List<TeamApplicationModel> _applications;
@override@JsonKey() List<TeamApplicationModel> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}


/// Create a copy of TeamDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamDetailModelCopyWith<_TeamDetailModel> get copyWith => __$TeamDetailModelCopyWithImpl<_TeamDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.tournamentsCount, tournamentsCount) || other.tournamentsCount == tournamentsCount)&&(identical(other.winsCount, winsCount) || other.winsCount == winsCount)&&(identical(other.winrate, winrate) || other.winrate == winrate)&&(identical(other.isCurrentUserCaptain, isCurrentUserCaptain) || other.isCurrentUserCaptain == isCurrentUserCaptain)&&(identical(other.inviteLink, inviteLink) || other.inviteLink == inviteLink)&&const DeepCollectionEquality().equals(other._teammates, _teammates)&&const DeepCollectionEquality().equals(other._tournaments, _tournaments)&&const DeepCollectionEquality().equals(other._applications, _applications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tag,avatarUrl,tournamentsCount,winsCount,winrate,isCurrentUserCaptain,inviteLink,const DeepCollectionEquality().hash(_teammates),const DeepCollectionEquality().hash(_tournaments),const DeepCollectionEquality().hash(_applications));

@override
String toString() {
  return 'TeamDetailModel(id: $id, name: $name, tag: $tag, avatarUrl: $avatarUrl, tournamentsCount: $tournamentsCount, winsCount: $winsCount, winrate: $winrate, isCurrentUserCaptain: $isCurrentUserCaptain, inviteLink: $inviteLink, teammates: $teammates, tournaments: $tournaments, applications: $applications)';
}


}

/// @nodoc
abstract mixin class _$TeamDetailModelCopyWith<$Res> implements $TeamDetailModelCopyWith<$Res> {
  factory _$TeamDetailModelCopyWith(_TeamDetailModel value, $Res Function(_TeamDetailModel) _then) = __$TeamDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String tag, String avatarUrl, int tournamentsCount, int winsCount, double winrate, bool isCurrentUserCaptain, String inviteLink, List<TeammateModel> teammates, List<TournamentModel> tournaments, List<TeamApplicationModel> applications
});




}
/// @nodoc
class __$TeamDetailModelCopyWithImpl<$Res>
    implements _$TeamDetailModelCopyWith<$Res> {
  __$TeamDetailModelCopyWithImpl(this._self, this._then);

  final _TeamDetailModel _self;
  final $Res Function(_TeamDetailModel) _then;

/// Create a copy of TeamDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tag = null,Object? avatarUrl = null,Object? tournamentsCount = null,Object? winsCount = null,Object? winrate = null,Object? isCurrentUserCaptain = null,Object? inviteLink = null,Object? teammates = null,Object? tournaments = null,Object? applications = null,}) {
  return _then(_TeamDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,tournamentsCount: null == tournamentsCount ? _self.tournamentsCount : tournamentsCount // ignore: cast_nullable_to_non_nullable
as int,winsCount: null == winsCount ? _self.winsCount : winsCount // ignore: cast_nullable_to_non_nullable
as int,winrate: null == winrate ? _self.winrate : winrate // ignore: cast_nullable_to_non_nullable
as double,isCurrentUserCaptain: null == isCurrentUserCaptain ? _self.isCurrentUserCaptain : isCurrentUserCaptain // ignore: cast_nullable_to_non_nullable
as bool,inviteLink: null == inviteLink ? _self.inviteLink : inviteLink // ignore: cast_nullable_to_non_nullable
as String,teammates: null == teammates ? _self._teammates : teammates // ignore: cast_nullable_to_non_nullable
as List<TeammateModel>,tournaments: null == tournaments ? _self._tournaments : tournaments // ignore: cast_nullable_to_non_nullable
as List<TournamentModel>,applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<TeamApplicationModel>,
  ));
}


}

// dart format on
