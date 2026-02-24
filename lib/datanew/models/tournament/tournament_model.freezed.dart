// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TournamentModel {

 String get id; String get title; String get imageUrl; String get discipline; bool get isOnline; String? get address; String get bracketType; String get teamMode; String get description; String get rules; DateTime get startDate; String get status; ParticipantsInfoModel get participants; List<PrizeItemModel> get prizes; List<TournamentEntryItemModel> get entries; List<MatchItemModel> get matches; String? get creatorId;
/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentModelCopyWith<TournamentModel> get copyWith => _$TournamentModelCopyWithImpl<TournamentModel>(this as TournamentModel, _$identity);

  /// Serializes this TournamentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.discipline, discipline) || other.discipline == discipline)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.address, address) || other.address == address)&&(identical(other.bracketType, bracketType) || other.bracketType == bracketType)&&(identical(other.teamMode, teamMode) || other.teamMode == teamMode)&&(identical(other.description, description) || other.description == description)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.participants, participants) || other.participants == participants)&&const DeepCollectionEquality().equals(other.prizes, prizes)&&const DeepCollectionEquality().equals(other.entries, entries)&&const DeepCollectionEquality().equals(other.matches, matches)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,discipline,isOnline,address,bracketType,teamMode,description,rules,startDate,status,participants,const DeepCollectionEquality().hash(prizes),const DeepCollectionEquality().hash(entries),const DeepCollectionEquality().hash(matches),creatorId);

@override
String toString() {
  return 'TournamentModel(id: $id, title: $title, imageUrl: $imageUrl, discipline: $discipline, isOnline: $isOnline, address: $address, bracketType: $bracketType, teamMode: $teamMode, description: $description, rules: $rules, startDate: $startDate, status: $status, participants: $participants, prizes: $prizes, entries: $entries, matches: $matches, creatorId: $creatorId)';
}


}

/// @nodoc
abstract mixin class $TournamentModelCopyWith<$Res>  {
  factory $TournamentModelCopyWith(TournamentModel value, $Res Function(TournamentModel) _then) = _$TournamentModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String imageUrl, String discipline, bool isOnline, String? address, String bracketType, String teamMode, String description, String rules, DateTime startDate, String status, ParticipantsInfoModel participants, List<PrizeItemModel> prizes, List<TournamentEntryItemModel> entries, List<MatchItemModel> matches, String? creatorId
});


$ParticipantsInfoModelCopyWith<$Res> get participants;

}
/// @nodoc
class _$TournamentModelCopyWithImpl<$Res>
    implements $TournamentModelCopyWith<$Res> {
  _$TournamentModelCopyWithImpl(this._self, this._then);

  final TournamentModel _self;
  final $Res Function(TournamentModel) _then;

/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? discipline = null,Object? isOnline = null,Object? address = freezed,Object? bracketType = null,Object? teamMode = null,Object? description = null,Object? rules = null,Object? startDate = null,Object? status = null,Object? participants = null,Object? prizes = null,Object? entries = null,Object? matches = null,Object? creatorId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,discipline: null == discipline ? _self.discipline : discipline // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,bracketType: null == bracketType ? _self.bracketType : bracketType // ignore: cast_nullable_to_non_nullable
as String,teamMode: null == teamMode ? _self.teamMode : teamMode // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as ParticipantsInfoModel,prizes: null == prizes ? _self.prizes : prizes // ignore: cast_nullable_to_non_nullable
as List<PrizeItemModel>,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<TournamentEntryItemModel>,matches: null == matches ? _self.matches : matches // ignore: cast_nullable_to_non_nullable
as List<MatchItemModel>,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParticipantsInfoModelCopyWith<$Res> get participants {
  
  return $ParticipantsInfoModelCopyWith<$Res>(_self.participants, (value) {
    return _then(_self.copyWith(participants: value));
  });
}
}


/// Adds pattern-matching-related methods to [TournamentModel].
extension TournamentModelPatterns on TournamentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TournamentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TournamentModel value)  $default,){
final _that = this;
switch (_that) {
case _TournamentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TournamentModel value)?  $default,){
final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  String discipline,  bool isOnline,  String? address,  String bracketType,  String teamMode,  String description,  String rules,  DateTime startDate,  String status,  ParticipantsInfoModel participants,  List<PrizeItemModel> prizes,  List<TournamentEntryItemModel> entries,  List<MatchItemModel> matches,  String? creatorId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.discipline,_that.isOnline,_that.address,_that.bracketType,_that.teamMode,_that.description,_that.rules,_that.startDate,_that.status,_that.participants,_that.prizes,_that.entries,_that.matches,_that.creatorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  String discipline,  bool isOnline,  String? address,  String bracketType,  String teamMode,  String description,  String rules,  DateTime startDate,  String status,  ParticipantsInfoModel participants,  List<PrizeItemModel> prizes,  List<TournamentEntryItemModel> entries,  List<MatchItemModel> matches,  String? creatorId)  $default,) {final _that = this;
switch (_that) {
case _TournamentModel():
return $default(_that.id,_that.title,_that.imageUrl,_that.discipline,_that.isOnline,_that.address,_that.bracketType,_that.teamMode,_that.description,_that.rules,_that.startDate,_that.status,_that.participants,_that.prizes,_that.entries,_that.matches,_that.creatorId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String imageUrl,  String discipline,  bool isOnline,  String? address,  String bracketType,  String teamMode,  String description,  String rules,  DateTime startDate,  String status,  ParticipantsInfoModel participants,  List<PrizeItemModel> prizes,  List<TournamentEntryItemModel> entries,  List<MatchItemModel> matches,  String? creatorId)?  $default,) {final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.discipline,_that.isOnline,_that.address,_that.bracketType,_that.teamMode,_that.description,_that.rules,_that.startDate,_that.status,_that.participants,_that.prizes,_that.entries,_that.matches,_that.creatorId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TournamentModel implements TournamentModel {
  const _TournamentModel({required this.id, required this.title, required this.imageUrl, required this.discipline, required this.isOnline, this.address, required this.bracketType, required this.teamMode, required this.description, required this.rules, required this.startDate, required this.status, required this.participants, final  List<PrizeItemModel> prizes = const [], final  List<TournamentEntryItemModel> entries = const [], final  List<MatchItemModel> matches = const [], this.creatorId}): _prizes = prizes,_entries = entries,_matches = matches;
  factory _TournamentModel.fromJson(Map<String, dynamic> json) => _$TournamentModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String imageUrl;
@override final  String discipline;
@override final  bool isOnline;
@override final  String? address;
@override final  String bracketType;
@override final  String teamMode;
@override final  String description;
@override final  String rules;
@override final  DateTime startDate;
@override final  String status;
@override final  ParticipantsInfoModel participants;
 final  List<PrizeItemModel> _prizes;
@override@JsonKey() List<PrizeItemModel> get prizes {
  if (_prizes is EqualUnmodifiableListView) return _prizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prizes);
}

 final  List<TournamentEntryItemModel> _entries;
@override@JsonKey() List<TournamentEntryItemModel> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

 final  List<MatchItemModel> _matches;
@override@JsonKey() List<MatchItemModel> get matches {
  if (_matches is EqualUnmodifiableListView) return _matches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matches);
}

@override final  String? creatorId;

/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TournamentModelCopyWith<_TournamentModel> get copyWith => __$TournamentModelCopyWithImpl<_TournamentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TournamentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TournamentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.discipline, discipline) || other.discipline == discipline)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.address, address) || other.address == address)&&(identical(other.bracketType, bracketType) || other.bracketType == bracketType)&&(identical(other.teamMode, teamMode) || other.teamMode == teamMode)&&(identical(other.description, description) || other.description == description)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.participants, participants) || other.participants == participants)&&const DeepCollectionEquality().equals(other._prizes, _prizes)&&const DeepCollectionEquality().equals(other._entries, _entries)&&const DeepCollectionEquality().equals(other._matches, _matches)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,discipline,isOnline,address,bracketType,teamMode,description,rules,startDate,status,participants,const DeepCollectionEquality().hash(_prizes),const DeepCollectionEquality().hash(_entries),const DeepCollectionEquality().hash(_matches),creatorId);

@override
String toString() {
  return 'TournamentModel(id: $id, title: $title, imageUrl: $imageUrl, discipline: $discipline, isOnline: $isOnline, address: $address, bracketType: $bracketType, teamMode: $teamMode, description: $description, rules: $rules, startDate: $startDate, status: $status, participants: $participants, prizes: $prizes, entries: $entries, matches: $matches, creatorId: $creatorId)';
}


}

/// @nodoc
abstract mixin class _$TournamentModelCopyWith<$Res> implements $TournamentModelCopyWith<$Res> {
  factory _$TournamentModelCopyWith(_TournamentModel value, $Res Function(_TournamentModel) _then) = __$TournamentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String imageUrl, String discipline, bool isOnline, String? address, String bracketType, String teamMode, String description, String rules, DateTime startDate, String status, ParticipantsInfoModel participants, List<PrizeItemModel> prizes, List<TournamentEntryItemModel> entries, List<MatchItemModel> matches, String? creatorId
});


@override $ParticipantsInfoModelCopyWith<$Res> get participants;

}
/// @nodoc
class __$TournamentModelCopyWithImpl<$Res>
    implements _$TournamentModelCopyWith<$Res> {
  __$TournamentModelCopyWithImpl(this._self, this._then);

  final _TournamentModel _self;
  final $Res Function(_TournamentModel) _then;

/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? discipline = null,Object? isOnline = null,Object? address = freezed,Object? bracketType = null,Object? teamMode = null,Object? description = null,Object? rules = null,Object? startDate = null,Object? status = null,Object? participants = null,Object? prizes = null,Object? entries = null,Object? matches = null,Object? creatorId = freezed,}) {
  return _then(_TournamentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,discipline: null == discipline ? _self.discipline : discipline // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,bracketType: null == bracketType ? _self.bracketType : bracketType // ignore: cast_nullable_to_non_nullable
as String,teamMode: null == teamMode ? _self.teamMode : teamMode // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as ParticipantsInfoModel,prizes: null == prizes ? _self._prizes : prizes // ignore: cast_nullable_to_non_nullable
as List<PrizeItemModel>,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<TournamentEntryItemModel>,matches: null == matches ? _self._matches : matches // ignore: cast_nullable_to_non_nullable
as List<MatchItemModel>,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParticipantsInfoModelCopyWith<$Res> get participants {
  
  return $ParticipantsInfoModelCopyWith<$Res>(_self.participants, (value) {
    return _then(_self.copyWith(participants: value));
  });
}
}


/// @nodoc
mixin _$ParticipantsInfoModel {

 int get current; int get max;
/// Create a copy of ParticipantsInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParticipantsInfoModelCopyWith<ParticipantsInfoModel> get copyWith => _$ParticipantsInfoModelCopyWithImpl<ParticipantsInfoModel>(this as ParticipantsInfoModel, _$identity);

  /// Serializes this ParticipantsInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParticipantsInfoModel&&(identical(other.current, current) || other.current == current)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,max);

@override
String toString() {
  return 'ParticipantsInfoModel(current: $current, max: $max)';
}


}

/// @nodoc
abstract mixin class $ParticipantsInfoModelCopyWith<$Res>  {
  factory $ParticipantsInfoModelCopyWith(ParticipantsInfoModel value, $Res Function(ParticipantsInfoModel) _then) = _$ParticipantsInfoModelCopyWithImpl;
@useResult
$Res call({
 int current, int max
});




}
/// @nodoc
class _$ParticipantsInfoModelCopyWithImpl<$Res>
    implements $ParticipantsInfoModelCopyWith<$Res> {
  _$ParticipantsInfoModelCopyWithImpl(this._self, this._then);

  final ParticipantsInfoModel _self;
  final $Res Function(ParticipantsInfoModel) _then;

/// Create a copy of ParticipantsInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? max = null,}) {
  return _then(_self.copyWith(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ParticipantsInfoModel].
extension ParticipantsInfoModelPatterns on ParticipantsInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParticipantsInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParticipantsInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParticipantsInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ParticipantsInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParticipantsInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ParticipantsInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int current,  int max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParticipantsInfoModel() when $default != null:
return $default(_that.current,_that.max);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int current,  int max)  $default,) {final _that = this;
switch (_that) {
case _ParticipantsInfoModel():
return $default(_that.current,_that.max);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int current,  int max)?  $default,) {final _that = this;
switch (_that) {
case _ParticipantsInfoModel() when $default != null:
return $default(_that.current,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParticipantsInfoModel implements ParticipantsInfoModel {
  const _ParticipantsInfoModel({required this.current, required this.max});
  factory _ParticipantsInfoModel.fromJson(Map<String, dynamic> json) => _$ParticipantsInfoModelFromJson(json);

@override final  int current;
@override final  int max;

/// Create a copy of ParticipantsInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParticipantsInfoModelCopyWith<_ParticipantsInfoModel> get copyWith => __$ParticipantsInfoModelCopyWithImpl<_ParticipantsInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParticipantsInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParticipantsInfoModel&&(identical(other.current, current) || other.current == current)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,max);

@override
String toString() {
  return 'ParticipantsInfoModel(current: $current, max: $max)';
}


}

/// @nodoc
abstract mixin class _$ParticipantsInfoModelCopyWith<$Res> implements $ParticipantsInfoModelCopyWith<$Res> {
  factory _$ParticipantsInfoModelCopyWith(_ParticipantsInfoModel value, $Res Function(_ParticipantsInfoModel) _then) = __$ParticipantsInfoModelCopyWithImpl;
@override @useResult
$Res call({
 int current, int max
});




}
/// @nodoc
class __$ParticipantsInfoModelCopyWithImpl<$Res>
    implements _$ParticipantsInfoModelCopyWith<$Res> {
  __$ParticipantsInfoModelCopyWithImpl(this._self, this._then);

  final _ParticipantsInfoModel _self;
  final $Res Function(_ParticipantsInfoModel) _then;

/// Create a copy of ParticipantsInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? max = null,}) {
  return _then(_ParticipantsInfoModel(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PrizeItemModel {

 String get label; String get amount;
/// Create a copy of PrizeItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrizeItemModelCopyWith<PrizeItemModel> get copyWith => _$PrizeItemModelCopyWithImpl<PrizeItemModel>(this as PrizeItemModel, _$identity);

  /// Serializes this PrizeItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrizeItemModel&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amount);

@override
String toString() {
  return 'PrizeItemModel(label: $label, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $PrizeItemModelCopyWith<$Res>  {
  factory $PrizeItemModelCopyWith(PrizeItemModel value, $Res Function(PrizeItemModel) _then) = _$PrizeItemModelCopyWithImpl;
@useResult
$Res call({
 String label, String amount
});




}
/// @nodoc
class _$PrizeItemModelCopyWithImpl<$Res>
    implements $PrizeItemModelCopyWith<$Res> {
  _$PrizeItemModelCopyWithImpl(this._self, this._then);

  final PrizeItemModel _self;
  final $Res Function(PrizeItemModel) _then;

/// Create a copy of PrizeItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? amount = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PrizeItemModel].
extension PrizeItemModelPatterns on PrizeItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrizeItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrizeItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrizeItemModel value)  $default,){
final _that = this;
switch (_that) {
case _PrizeItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrizeItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrizeItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrizeItemModel() when $default != null:
return $default(_that.label,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String amount)  $default,) {final _that = this;
switch (_that) {
case _PrizeItemModel():
return $default(_that.label,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String amount)?  $default,) {final _that = this;
switch (_that) {
case _PrizeItemModel() when $default != null:
return $default(_that.label,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrizeItemModel implements PrizeItemModel {
  const _PrizeItemModel({required this.label, required this.amount});
  factory _PrizeItemModel.fromJson(Map<String, dynamic> json) => _$PrizeItemModelFromJson(json);

@override final  String label;
@override final  String amount;

/// Create a copy of PrizeItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrizeItemModelCopyWith<_PrizeItemModel> get copyWith => __$PrizeItemModelCopyWithImpl<_PrizeItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrizeItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrizeItemModel&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amount);

@override
String toString() {
  return 'PrizeItemModel(label: $label, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$PrizeItemModelCopyWith<$Res> implements $PrizeItemModelCopyWith<$Res> {
  factory _$PrizeItemModelCopyWith(_PrizeItemModel value, $Res Function(_PrizeItemModel) _then) = __$PrizeItemModelCopyWithImpl;
@override @useResult
$Res call({
 String label, String amount
});




}
/// @nodoc
class __$PrizeItemModelCopyWithImpl<$Res>
    implements _$PrizeItemModelCopyWith<$Res> {
  __$PrizeItemModelCopyWithImpl(this._self, this._then);

  final _PrizeItemModel _self;
  final $Res Function(_PrizeItemModel) _then;

/// Create a copy of PrizeItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? amount = null,}) {
  return _then(_PrizeItemModel(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TournamentEntryItemModel {

 String get id; String get userId; String? get teamId;
/// Create a copy of TournamentEntryItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentEntryItemModelCopyWith<TournamentEntryItemModel> get copyWith => _$TournamentEntryItemModelCopyWithImpl<TournamentEntryItemModel>(this as TournamentEntryItemModel, _$identity);

  /// Serializes this TournamentEntryItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentEntryItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.teamId, teamId) || other.teamId == teamId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,teamId);

@override
String toString() {
  return 'TournamentEntryItemModel(id: $id, userId: $userId, teamId: $teamId)';
}


}

/// @nodoc
abstract mixin class $TournamentEntryItemModelCopyWith<$Res>  {
  factory $TournamentEntryItemModelCopyWith(TournamentEntryItemModel value, $Res Function(TournamentEntryItemModel) _then) = _$TournamentEntryItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String? teamId
});




}
/// @nodoc
class _$TournamentEntryItemModelCopyWithImpl<$Res>
    implements $TournamentEntryItemModelCopyWith<$Res> {
  _$TournamentEntryItemModelCopyWithImpl(this._self, this._then);

  final TournamentEntryItemModel _self;
  final $Res Function(TournamentEntryItemModel) _then;

/// Create a copy of TournamentEntryItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? teamId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TournamentEntryItemModel].
extension TournamentEntryItemModelPatterns on TournamentEntryItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TournamentEntryItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TournamentEntryItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TournamentEntryItemModel value)  $default,){
final _that = this;
switch (_that) {
case _TournamentEntryItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TournamentEntryItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _TournamentEntryItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String? teamId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TournamentEntryItemModel() when $default != null:
return $default(_that.id,_that.userId,_that.teamId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String? teamId)  $default,) {final _that = this;
switch (_that) {
case _TournamentEntryItemModel():
return $default(_that.id,_that.userId,_that.teamId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String? teamId)?  $default,) {final _that = this;
switch (_that) {
case _TournamentEntryItemModel() when $default != null:
return $default(_that.id,_that.userId,_that.teamId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TournamentEntryItemModel implements TournamentEntryItemModel {
  const _TournamentEntryItemModel({required this.id, required this.userId, this.teamId});
  factory _TournamentEntryItemModel.fromJson(Map<String, dynamic> json) => _$TournamentEntryItemModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String? teamId;

/// Create a copy of TournamentEntryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TournamentEntryItemModelCopyWith<_TournamentEntryItemModel> get copyWith => __$TournamentEntryItemModelCopyWithImpl<_TournamentEntryItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TournamentEntryItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TournamentEntryItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.teamId, teamId) || other.teamId == teamId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,teamId);

@override
String toString() {
  return 'TournamentEntryItemModel(id: $id, userId: $userId, teamId: $teamId)';
}


}

/// @nodoc
abstract mixin class _$TournamentEntryItemModelCopyWith<$Res> implements $TournamentEntryItemModelCopyWith<$Res> {
  factory _$TournamentEntryItemModelCopyWith(_TournamentEntryItemModel value, $Res Function(_TournamentEntryItemModel) _then) = __$TournamentEntryItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String? teamId
});




}
/// @nodoc
class __$TournamentEntryItemModelCopyWithImpl<$Res>
    implements _$TournamentEntryItemModelCopyWith<$Res> {
  __$TournamentEntryItemModelCopyWithImpl(this._self, this._then);

  final _TournamentEntryItemModel _self;
  final $Res Function(_TournamentEntryItemModel) _then;

/// Create a copy of TournamentEntryItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? teamId = freezed,}) {
  return _then(_TournamentEntryItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MatchItemModel {

 String get id; int get round; int get position; String? get participant1; String? get participant2; int get score1; int get score2;
/// Create a copy of MatchItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchItemModelCopyWith<MatchItemModel> get copyWith => _$MatchItemModelCopyWithImpl<MatchItemModel>(this as MatchItemModel, _$identity);

  /// Serializes this MatchItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.round, round) || other.round == round)&&(identical(other.position, position) || other.position == position)&&(identical(other.participant1, participant1) || other.participant1 == participant1)&&(identical(other.participant2, participant2) || other.participant2 == participant2)&&(identical(other.score1, score1) || other.score1 == score1)&&(identical(other.score2, score2) || other.score2 == score2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,round,position,participant1,participant2,score1,score2);

@override
String toString() {
  return 'MatchItemModel(id: $id, round: $round, position: $position, participant1: $participant1, participant2: $participant2, score1: $score1, score2: $score2)';
}


}

/// @nodoc
abstract mixin class $MatchItemModelCopyWith<$Res>  {
  factory $MatchItemModelCopyWith(MatchItemModel value, $Res Function(MatchItemModel) _then) = _$MatchItemModelCopyWithImpl;
@useResult
$Res call({
 String id, int round, int position, String? participant1, String? participant2, int score1, int score2
});




}
/// @nodoc
class _$MatchItemModelCopyWithImpl<$Res>
    implements $MatchItemModelCopyWith<$Res> {
  _$MatchItemModelCopyWithImpl(this._self, this._then);

  final MatchItemModel _self;
  final $Res Function(MatchItemModel) _then;

/// Create a copy of MatchItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? round = null,Object? position = null,Object? participant1 = freezed,Object? participant2 = freezed,Object? score1 = null,Object? score2 = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,participant1: freezed == participant1 ? _self.participant1 : participant1 // ignore: cast_nullable_to_non_nullable
as String?,participant2: freezed == participant2 ? _self.participant2 : participant2 // ignore: cast_nullable_to_non_nullable
as String?,score1: null == score1 ? _self.score1 : score1 // ignore: cast_nullable_to_non_nullable
as int,score2: null == score2 ? _self.score2 : score2 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchItemModel].
extension MatchItemModelPatterns on MatchItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchItemModel value)  $default,){
final _that = this;
switch (_that) {
case _MatchItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatchItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int round,  int position,  String? participant1,  String? participant2,  int score1,  int score2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchItemModel() when $default != null:
return $default(_that.id,_that.round,_that.position,_that.participant1,_that.participant2,_that.score1,_that.score2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int round,  int position,  String? participant1,  String? participant2,  int score1,  int score2)  $default,) {final _that = this;
switch (_that) {
case _MatchItemModel():
return $default(_that.id,_that.round,_that.position,_that.participant1,_that.participant2,_that.score1,_that.score2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int round,  int position,  String? participant1,  String? participant2,  int score1,  int score2)?  $default,) {final _that = this;
switch (_that) {
case _MatchItemModel() when $default != null:
return $default(_that.id,_that.round,_that.position,_that.participant1,_that.participant2,_that.score1,_that.score2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchItemModel implements MatchItemModel {
  const _MatchItemModel({required this.id, required this.round, required this.position, this.participant1, this.participant2, this.score1 = 0, this.score2 = 0});
  factory _MatchItemModel.fromJson(Map<String, dynamic> json) => _$MatchItemModelFromJson(json);

@override final  String id;
@override final  int round;
@override final  int position;
@override final  String? participant1;
@override final  String? participant2;
@override@JsonKey() final  int score1;
@override@JsonKey() final  int score2;

/// Create a copy of MatchItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchItemModelCopyWith<_MatchItemModel> get copyWith => __$MatchItemModelCopyWithImpl<_MatchItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.round, round) || other.round == round)&&(identical(other.position, position) || other.position == position)&&(identical(other.participant1, participant1) || other.participant1 == participant1)&&(identical(other.participant2, participant2) || other.participant2 == participant2)&&(identical(other.score1, score1) || other.score1 == score1)&&(identical(other.score2, score2) || other.score2 == score2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,round,position,participant1,participant2,score1,score2);

@override
String toString() {
  return 'MatchItemModel(id: $id, round: $round, position: $position, participant1: $participant1, participant2: $participant2, score1: $score1, score2: $score2)';
}


}

/// @nodoc
abstract mixin class _$MatchItemModelCopyWith<$Res> implements $MatchItemModelCopyWith<$Res> {
  factory _$MatchItemModelCopyWith(_MatchItemModel value, $Res Function(_MatchItemModel) _then) = __$MatchItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int round, int position, String? participant1, String? participant2, int score1, int score2
});




}
/// @nodoc
class __$MatchItemModelCopyWithImpl<$Res>
    implements _$MatchItemModelCopyWith<$Res> {
  __$MatchItemModelCopyWithImpl(this._self, this._then);

  final _MatchItemModel _self;
  final $Res Function(_MatchItemModel) _then;

/// Create a copy of MatchItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? round = null,Object? position = null,Object? participant1 = freezed,Object? participant2 = freezed,Object? score1 = null,Object? score2 = null,}) {
  return _then(_MatchItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,participant1: freezed == participant1 ? _self.participant1 : participant1 // ignore: cast_nullable_to_non_nullable
as String?,participant2: freezed == participant2 ? _self.participant2 : participant2 // ignore: cast_nullable_to_non_nullable
as String?,score1: null == score1 ? _self.score1 : score1 // ignore: cast_nullable_to_non_nullable
as int,score2: null == score2 ? _self.score2 : score2 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
