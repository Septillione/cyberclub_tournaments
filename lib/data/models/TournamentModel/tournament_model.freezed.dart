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

 String get id; String get title; String get imageUrl;@JsonKey(unknownEnumValue: Discipline.DOTA2) Discipline get discipline; bool get isOnline; String? get address;@JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION) BracketType get bracketType;@JsonKey(unknownEnumValue: TeamMode.team5v5) TeamMode get teamMode; String get description; String get rules; DateTime get startDate;@JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED) TournamentStatus get status; ParticipantsInfo get participants; List<PrizeItem> get prizes; List<TournamentEntryItem> get entries; List<MatchModel> get matches; String? get creatorId;
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
 String id, String title, String imageUrl,@JsonKey(unknownEnumValue: Discipline.DOTA2) Discipline discipline, bool isOnline, String? address,@JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION) BracketType bracketType,@JsonKey(unknownEnumValue: TeamMode.team5v5) TeamMode teamMode, String description, String rules, DateTime startDate,@JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED) TournamentStatus status, ParticipantsInfo participants, List<PrizeItem> prizes, List<TournamentEntryItem> entries, List<MatchModel> matches, String? creatorId
});


$ParticipantsInfoCopyWith<$Res> get participants;

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
as Discipline,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,bracketType: null == bracketType ? _self.bracketType : bracketType // ignore: cast_nullable_to_non_nullable
as BracketType,teamMode: null == teamMode ? _self.teamMode : teamMode // ignore: cast_nullable_to_non_nullable
as TeamMode,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TournamentStatus,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as ParticipantsInfo,prizes: null == prizes ? _self.prizes : prizes // ignore: cast_nullable_to_non_nullable
as List<PrizeItem>,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<TournamentEntryItem>,matches: null == matches ? _self.matches : matches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParticipantsInfoCopyWith<$Res> get participants {
  
  return $ParticipantsInfoCopyWith<$Res>(_self.participants, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl, @JsonKey(unknownEnumValue: Discipline.DOTA2)  Discipline discipline,  bool isOnline,  String? address, @JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION)  BracketType bracketType, @JsonKey(unknownEnumValue: TeamMode.team5v5)  TeamMode teamMode,  String description,  String rules,  DateTime startDate, @JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED)  TournamentStatus status,  ParticipantsInfo participants,  List<PrizeItem> prizes,  List<TournamentEntryItem> entries,  List<MatchModel> matches,  String? creatorId)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl, @JsonKey(unknownEnumValue: Discipline.DOTA2)  Discipline discipline,  bool isOnline,  String? address, @JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION)  BracketType bracketType, @JsonKey(unknownEnumValue: TeamMode.team5v5)  TeamMode teamMode,  String description,  String rules,  DateTime startDate, @JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED)  TournamentStatus status,  ParticipantsInfo participants,  List<PrizeItem> prizes,  List<TournamentEntryItem> entries,  List<MatchModel> matches,  String? creatorId)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String imageUrl, @JsonKey(unknownEnumValue: Discipline.DOTA2)  Discipline discipline,  bool isOnline,  String? address, @JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION)  BracketType bracketType, @JsonKey(unknownEnumValue: TeamMode.team5v5)  TeamMode teamMode,  String description,  String rules,  DateTime startDate, @JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED)  TournamentStatus status,  ParticipantsInfo participants,  List<PrizeItem> prizes,  List<TournamentEntryItem> entries,  List<MatchModel> matches,  String? creatorId)?  $default,) {final _that = this;
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
  const _TournamentModel({required this.id, required this.title, required this.imageUrl, @JsonKey(unknownEnumValue: Discipline.DOTA2) required this.discipline, required this.isOnline, this.address, @JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION) required this.bracketType, @JsonKey(unknownEnumValue: TeamMode.team5v5) required this.teamMode, required this.description, required this.rules, required this.startDate, @JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED) required this.status, required this.participants, final  List<PrizeItem> prizes = const [], final  List<TournamentEntryItem> entries = const [], final  List<MatchModel> matches = const [], this.creatorId}): _prizes = prizes,_entries = entries,_matches = matches;
  factory _TournamentModel.fromJson(Map<String, dynamic> json) => _$TournamentModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String imageUrl;
@override@JsonKey(unknownEnumValue: Discipline.DOTA2) final  Discipline discipline;
@override final  bool isOnline;
@override final  String? address;
@override@JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION) final  BracketType bracketType;
@override@JsonKey(unknownEnumValue: TeamMode.team5v5) final  TeamMode teamMode;
@override final  String description;
@override final  String rules;
@override final  DateTime startDate;
@override@JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED) final  TournamentStatus status;
@override final  ParticipantsInfo participants;
 final  List<PrizeItem> _prizes;
@override@JsonKey() List<PrizeItem> get prizes {
  if (_prizes is EqualUnmodifiableListView) return _prizes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prizes);
}

 final  List<TournamentEntryItem> _entries;
@override@JsonKey() List<TournamentEntryItem> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

 final  List<MatchModel> _matches;
@override@JsonKey() List<MatchModel> get matches {
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
 String id, String title, String imageUrl,@JsonKey(unknownEnumValue: Discipline.DOTA2) Discipline discipline, bool isOnline, String? address,@JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION) BracketType bracketType,@JsonKey(unknownEnumValue: TeamMode.team5v5) TeamMode teamMode, String description, String rules, DateTime startDate,@JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED) TournamentStatus status, ParticipantsInfo participants, List<PrizeItem> prizes, List<TournamentEntryItem> entries, List<MatchModel> matches, String? creatorId
});


@override $ParticipantsInfoCopyWith<$Res> get participants;

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
as Discipline,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,bracketType: null == bracketType ? _self.bracketType : bracketType // ignore: cast_nullable_to_non_nullable
as BracketType,teamMode: null == teamMode ? _self.teamMode : teamMode // ignore: cast_nullable_to_non_nullable
as TeamMode,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TournamentStatus,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as ParticipantsInfo,prizes: null == prizes ? _self._prizes : prizes // ignore: cast_nullable_to_non_nullable
as List<PrizeItem>,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<TournamentEntryItem>,matches: null == matches ? _self._matches : matches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,creatorId: freezed == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParticipantsInfoCopyWith<$Res> get participants {
  
  return $ParticipantsInfoCopyWith<$Res>(_self.participants, (value) {
    return _then(_self.copyWith(participants: value));
  });
}
}


/// @nodoc
mixin _$ParticipantsInfo {

 int get current; int get max;
/// Create a copy of ParticipantsInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParticipantsInfoCopyWith<ParticipantsInfo> get copyWith => _$ParticipantsInfoCopyWithImpl<ParticipantsInfo>(this as ParticipantsInfo, _$identity);

  /// Serializes this ParticipantsInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParticipantsInfo&&(identical(other.current, current) || other.current == current)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,max);

@override
String toString() {
  return 'ParticipantsInfo(current: $current, max: $max)';
}


}

/// @nodoc
abstract mixin class $ParticipantsInfoCopyWith<$Res>  {
  factory $ParticipantsInfoCopyWith(ParticipantsInfo value, $Res Function(ParticipantsInfo) _then) = _$ParticipantsInfoCopyWithImpl;
@useResult
$Res call({
 int current, int max
});




}
/// @nodoc
class _$ParticipantsInfoCopyWithImpl<$Res>
    implements $ParticipantsInfoCopyWith<$Res> {
  _$ParticipantsInfoCopyWithImpl(this._self, this._then);

  final ParticipantsInfo _self;
  final $Res Function(ParticipantsInfo) _then;

/// Create a copy of ParticipantsInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? max = null,}) {
  return _then(_self.copyWith(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ParticipantsInfo].
extension ParticipantsInfoPatterns on ParticipantsInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParticipantsInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParticipantsInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParticipantsInfo value)  $default,){
final _that = this;
switch (_that) {
case _ParticipantsInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParticipantsInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ParticipantsInfo() when $default != null:
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
case _ParticipantsInfo() when $default != null:
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
case _ParticipantsInfo():
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
case _ParticipantsInfo() when $default != null:
return $default(_that.current,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParticipantsInfo implements ParticipantsInfo {
  const _ParticipantsInfo({required this.current, required this.max});
  factory _ParticipantsInfo.fromJson(Map<String, dynamic> json) => _$ParticipantsInfoFromJson(json);

@override final  int current;
@override final  int max;

/// Create a copy of ParticipantsInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParticipantsInfoCopyWith<_ParticipantsInfo> get copyWith => __$ParticipantsInfoCopyWithImpl<_ParticipantsInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParticipantsInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParticipantsInfo&&(identical(other.current, current) || other.current == current)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,max);

@override
String toString() {
  return 'ParticipantsInfo(current: $current, max: $max)';
}


}

/// @nodoc
abstract mixin class _$ParticipantsInfoCopyWith<$Res> implements $ParticipantsInfoCopyWith<$Res> {
  factory _$ParticipantsInfoCopyWith(_ParticipantsInfo value, $Res Function(_ParticipantsInfo) _then) = __$ParticipantsInfoCopyWithImpl;
@override @useResult
$Res call({
 int current, int max
});




}
/// @nodoc
class __$ParticipantsInfoCopyWithImpl<$Res>
    implements _$ParticipantsInfoCopyWith<$Res> {
  __$ParticipantsInfoCopyWithImpl(this._self, this._then);

  final _ParticipantsInfo _self;
  final $Res Function(_ParticipantsInfo) _then;

/// Create a copy of ParticipantsInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? max = null,}) {
  return _then(_ParticipantsInfo(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PrizeItem {

 String get label; String get amount;
/// Create a copy of PrizeItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrizeItemCopyWith<PrizeItem> get copyWith => _$PrizeItemCopyWithImpl<PrizeItem>(this as PrizeItem, _$identity);

  /// Serializes this PrizeItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrizeItem&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amount);

@override
String toString() {
  return 'PrizeItem(label: $label, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $PrizeItemCopyWith<$Res>  {
  factory $PrizeItemCopyWith(PrizeItem value, $Res Function(PrizeItem) _then) = _$PrizeItemCopyWithImpl;
@useResult
$Res call({
 String label, String amount
});




}
/// @nodoc
class _$PrizeItemCopyWithImpl<$Res>
    implements $PrizeItemCopyWith<$Res> {
  _$PrizeItemCopyWithImpl(this._self, this._then);

  final PrizeItem _self;
  final $Res Function(PrizeItem) _then;

/// Create a copy of PrizeItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? amount = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PrizeItem].
extension PrizeItemPatterns on PrizeItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrizeItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrizeItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrizeItem value)  $default,){
final _that = this;
switch (_that) {
case _PrizeItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrizeItem value)?  $default,){
final _that = this;
switch (_that) {
case _PrizeItem() when $default != null:
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
case _PrizeItem() when $default != null:
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
case _PrizeItem():
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
case _PrizeItem() when $default != null:
return $default(_that.label,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrizeItem implements PrizeItem {
  const _PrizeItem({required this.label, required this.amount});
  factory _PrizeItem.fromJson(Map<String, dynamic> json) => _$PrizeItemFromJson(json);

@override final  String label;
@override final  String amount;

/// Create a copy of PrizeItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrizeItemCopyWith<_PrizeItem> get copyWith => __$PrizeItemCopyWithImpl<_PrizeItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrizeItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrizeItem&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,amount);

@override
String toString() {
  return 'PrizeItem(label: $label, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$PrizeItemCopyWith<$Res> implements $PrizeItemCopyWith<$Res> {
  factory _$PrizeItemCopyWith(_PrizeItem value, $Res Function(_PrizeItem) _then) = __$PrizeItemCopyWithImpl;
@override @useResult
$Res call({
 String label, String amount
});




}
/// @nodoc
class __$PrizeItemCopyWithImpl<$Res>
    implements _$PrizeItemCopyWith<$Res> {
  __$PrizeItemCopyWithImpl(this._self, this._then);

  final _PrizeItem _self;
  final $Res Function(_PrizeItem) _then;

/// Create a copy of PrizeItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? amount = null,}) {
  return _then(_PrizeItem(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TournamentEntryItem {

 String get id; String get userId; String? get teamId; TeamUserShort get user; TeamShortInfo? get team;
/// Create a copy of TournamentEntryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentEntryItemCopyWith<TournamentEntryItem> get copyWith => _$TournamentEntryItemCopyWithImpl<TournamentEntryItem>(this as TournamentEntryItem, _$identity);

  /// Serializes this TournamentEntryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentEntryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.user, user) || other.user == user)&&(identical(other.team, team) || other.team == team));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,teamId,user,team);

@override
String toString() {
  return 'TournamentEntryItem(id: $id, userId: $userId, teamId: $teamId, user: $user, team: $team)';
}


}

/// @nodoc
abstract mixin class $TournamentEntryItemCopyWith<$Res>  {
  factory $TournamentEntryItemCopyWith(TournamentEntryItem value, $Res Function(TournamentEntryItem) _then) = _$TournamentEntryItemCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String? teamId, TeamUserShort user, TeamShortInfo? team
});


$TeamUserShortCopyWith<$Res> get user;$TeamShortInfoCopyWith<$Res>? get team;

}
/// @nodoc
class _$TournamentEntryItemCopyWithImpl<$Res>
    implements $TournamentEntryItemCopyWith<$Res> {
  _$TournamentEntryItemCopyWithImpl(this._self, this._then);

  final TournamentEntryItem _self;
  final $Res Function(TournamentEntryItem) _then;

/// Create a copy of TournamentEntryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? teamId = freezed,Object? user = null,Object? team = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TeamUserShort,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as TeamShortInfo?,
  ));
}
/// Create a copy of TournamentEntryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamUserShortCopyWith<$Res> get user {
  
  return $TeamUserShortCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of TournamentEntryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamShortInfoCopyWith<$Res>? get team {
    if (_self.team == null) {
    return null;
  }

  return $TeamShortInfoCopyWith<$Res>(_self.team!, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// Adds pattern-matching-related methods to [TournamentEntryItem].
extension TournamentEntryItemPatterns on TournamentEntryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TournamentEntryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TournamentEntryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TournamentEntryItem value)  $default,){
final _that = this;
switch (_that) {
case _TournamentEntryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TournamentEntryItem value)?  $default,){
final _that = this;
switch (_that) {
case _TournamentEntryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String? teamId,  TeamUserShort user,  TeamShortInfo? team)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TournamentEntryItem() when $default != null:
return $default(_that.id,_that.userId,_that.teamId,_that.user,_that.team);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String? teamId,  TeamUserShort user,  TeamShortInfo? team)  $default,) {final _that = this;
switch (_that) {
case _TournamentEntryItem():
return $default(_that.id,_that.userId,_that.teamId,_that.user,_that.team);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String? teamId,  TeamUserShort user,  TeamShortInfo? team)?  $default,) {final _that = this;
switch (_that) {
case _TournamentEntryItem() when $default != null:
return $default(_that.id,_that.userId,_that.teamId,_that.user,_that.team);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TournamentEntryItem implements TournamentEntryItem {
  const _TournamentEntryItem({required this.id, required this.userId, this.teamId, required this.user, this.team});
  factory _TournamentEntryItem.fromJson(Map<String, dynamic> json) => _$TournamentEntryItemFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String? teamId;
@override final  TeamUserShort user;
@override final  TeamShortInfo? team;

/// Create a copy of TournamentEntryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TournamentEntryItemCopyWith<_TournamentEntryItem> get copyWith => __$TournamentEntryItemCopyWithImpl<_TournamentEntryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TournamentEntryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TournamentEntryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.user, user) || other.user == user)&&(identical(other.team, team) || other.team == team));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,teamId,user,team);

@override
String toString() {
  return 'TournamentEntryItem(id: $id, userId: $userId, teamId: $teamId, user: $user, team: $team)';
}


}

/// @nodoc
abstract mixin class _$TournamentEntryItemCopyWith<$Res> implements $TournamentEntryItemCopyWith<$Res> {
  factory _$TournamentEntryItemCopyWith(_TournamentEntryItem value, $Res Function(_TournamentEntryItem) _then) = __$TournamentEntryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String? teamId, TeamUserShort user, TeamShortInfo? team
});


@override $TeamUserShortCopyWith<$Res> get user;@override $TeamShortInfoCopyWith<$Res>? get team;

}
/// @nodoc
class __$TournamentEntryItemCopyWithImpl<$Res>
    implements _$TournamentEntryItemCopyWith<$Res> {
  __$TournamentEntryItemCopyWithImpl(this._self, this._then);

  final _TournamentEntryItem _self;
  final $Res Function(_TournamentEntryItem) _then;

/// Create a copy of TournamentEntryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? teamId = freezed,Object? user = null,Object? team = freezed,}) {
  return _then(_TournamentEntryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TeamUserShort,team: freezed == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as TeamShortInfo?,
  ));
}

/// Create a copy of TournamentEntryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamUserShortCopyWith<$Res> get user {
  
  return $TeamUserShortCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of TournamentEntryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TeamShortInfoCopyWith<$Res>? get team {
    if (_self.team == null) {
    return null;
  }

  return $TeamShortInfoCopyWith<$Res>(_self.team!, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// @nodoc
mixin _$MatchModel {

 String get id; int get round; int get position; String? get participant1; String? get participant2; int get score1; int get score2;
/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchModelCopyWith<MatchModel> get copyWith => _$MatchModelCopyWithImpl<MatchModel>(this as MatchModel, _$identity);

  /// Serializes this MatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.round, round) || other.round == round)&&(identical(other.position, position) || other.position == position)&&(identical(other.participant1, participant1) || other.participant1 == participant1)&&(identical(other.participant2, participant2) || other.participant2 == participant2)&&(identical(other.score1, score1) || other.score1 == score1)&&(identical(other.score2, score2) || other.score2 == score2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,round,position,participant1,participant2,score1,score2);

@override
String toString() {
  return 'MatchModel(id: $id, round: $round, position: $position, participant1: $participant1, participant2: $participant2, score1: $score1, score2: $score2)';
}


}

/// @nodoc
abstract mixin class $MatchModelCopyWith<$Res>  {
  factory $MatchModelCopyWith(MatchModel value, $Res Function(MatchModel) _then) = _$MatchModelCopyWithImpl;
@useResult
$Res call({
 String id, int round, int position, String? participant1, String? participant2, int score1, int score2
});




}
/// @nodoc
class _$MatchModelCopyWithImpl<$Res>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._self, this._then);

  final MatchModel _self;
  final $Res Function(MatchModel) _then;

/// Create a copy of MatchModel
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


/// Adds pattern-matching-related methods to [MatchModel].
extension MatchModelPatterns on MatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchModel value)  $default,){
final _that = this;
switch (_that) {
case _MatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
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
case _MatchModel() when $default != null:
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
case _MatchModel():
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
case _MatchModel() when $default != null:
return $default(_that.id,_that.round,_that.position,_that.participant1,_that.participant2,_that.score1,_that.score2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchModel implements MatchModel {
  const _MatchModel({required this.id, required this.round, required this.position, this.participant1, this.participant2, this.score1 = 0, this.score2 = 0});
  factory _MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);

@override final  String id;
@override final  int round;
@override final  int position;
@override final  String? participant1;
@override final  String? participant2;
@override@JsonKey() final  int score1;
@override@JsonKey() final  int score2;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchModelCopyWith<_MatchModel> get copyWith => __$MatchModelCopyWithImpl<_MatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.round, round) || other.round == round)&&(identical(other.position, position) || other.position == position)&&(identical(other.participant1, participant1) || other.participant1 == participant1)&&(identical(other.participant2, participant2) || other.participant2 == participant2)&&(identical(other.score1, score1) || other.score1 == score1)&&(identical(other.score2, score2) || other.score2 == score2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,round,position,participant1,participant2,score1,score2);

@override
String toString() {
  return 'MatchModel(id: $id, round: $round, position: $position, participant1: $participant1, participant2: $participant2, score1: $score1, score2: $score2)';
}


}

/// @nodoc
abstract mixin class _$MatchModelCopyWith<$Res> implements $MatchModelCopyWith<$Res> {
  factory _$MatchModelCopyWith(_MatchModel value, $Res Function(_MatchModel) _then) = __$MatchModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int round, int position, String? participant1, String? participant2, int score1, int score2
});




}
/// @nodoc
class __$MatchModelCopyWithImpl<$Res>
    implements _$MatchModelCopyWith<$Res> {
  __$MatchModelCopyWithImpl(this._self, this._then);

  final _MatchModel _self;
  final $Res Function(_MatchModel) _then;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? round = null,Object? position = null,Object? participant1 = freezed,Object? participant2 = freezed,Object? score1 = null,Object? score2 = null,}) {
  return _then(_MatchModel(
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
