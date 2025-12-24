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

 String get id; String get title; String get imageUrl;@JsonKey(unknownEnumValue: Discipline.DOTA2) Discipline get discipline; bool get isOnline; String? get address;@JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION) BracketType get bracketType;@JsonKey(unknownEnumValue: TeamMode.team5v5) TeamMode get teamMode; String get description; String get rules; DateTime get startDate;@JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED) TournamentStatus get status; ParticipantsInfo get participants; List<PrizeItem> get prizes; List<TournamentEntryItem> get entries;
/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentModelCopyWith<TournamentModel> get copyWith => _$TournamentModelCopyWithImpl<TournamentModel>(this as TournamentModel, _$identity);

  /// Serializes this TournamentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.discipline, discipline) || other.discipline == discipline)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.address, address) || other.address == address)&&(identical(other.bracketType, bracketType) || other.bracketType == bracketType)&&(identical(other.teamMode, teamMode) || other.teamMode == teamMode)&&(identical(other.description, description) || other.description == description)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.participants, participants) || other.participants == participants)&&const DeepCollectionEquality().equals(other.prizes, prizes)&&const DeepCollectionEquality().equals(other.entries, entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,discipline,isOnline,address,bracketType,teamMode,description,rules,startDate,status,participants,const DeepCollectionEquality().hash(prizes),const DeepCollectionEquality().hash(entries));

@override
String toString() {
  return 'TournamentModel(id: $id, title: $title, imageUrl: $imageUrl, discipline: $discipline, isOnline: $isOnline, address: $address, bracketType: $bracketType, teamMode: $teamMode, description: $description, rules: $rules, startDate: $startDate, status: $status, participants: $participants, prizes: $prizes, entries: $entries)';
}


}

/// @nodoc
abstract mixin class $TournamentModelCopyWith<$Res>  {
  factory $TournamentModelCopyWith(TournamentModel value, $Res Function(TournamentModel) _then) = _$TournamentModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String imageUrl,@JsonKey(unknownEnumValue: Discipline.DOTA2) Discipline discipline, bool isOnline, String? address,@JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION) BracketType bracketType,@JsonKey(unknownEnumValue: TeamMode.team5v5) TeamMode teamMode, String description, String rules, DateTime startDate,@JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED) TournamentStatus status, ParticipantsInfo participants, List<PrizeItem> prizes, List<TournamentEntryItem> entries
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? discipline = null,Object? isOnline = null,Object? address = freezed,Object? bracketType = null,Object? teamMode = null,Object? description = null,Object? rules = null,Object? startDate = null,Object? status = null,Object? participants = null,Object? prizes = null,Object? entries = null,}) {
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
as List<TournamentEntryItem>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl, @JsonKey(unknownEnumValue: Discipline.DOTA2)  Discipline discipline,  bool isOnline,  String? address, @JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION)  BracketType bracketType, @JsonKey(unknownEnumValue: TeamMode.team5v5)  TeamMode teamMode,  String description,  String rules,  DateTime startDate, @JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED)  TournamentStatus status,  ParticipantsInfo participants,  List<PrizeItem> prizes,  List<TournamentEntryItem> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.discipline,_that.isOnline,_that.address,_that.bracketType,_that.teamMode,_that.description,_that.rules,_that.startDate,_that.status,_that.participants,_that.prizes,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl, @JsonKey(unknownEnumValue: Discipline.DOTA2)  Discipline discipline,  bool isOnline,  String? address, @JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION)  BracketType bracketType, @JsonKey(unknownEnumValue: TeamMode.team5v5)  TeamMode teamMode,  String description,  String rules,  DateTime startDate, @JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED)  TournamentStatus status,  ParticipantsInfo participants,  List<PrizeItem> prizes,  List<TournamentEntryItem> entries)  $default,) {final _that = this;
switch (_that) {
case _TournamentModel():
return $default(_that.id,_that.title,_that.imageUrl,_that.discipline,_that.isOnline,_that.address,_that.bracketType,_that.teamMode,_that.description,_that.rules,_that.startDate,_that.status,_that.participants,_that.prizes,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String imageUrl, @JsonKey(unknownEnumValue: Discipline.DOTA2)  Discipline discipline,  bool isOnline,  String? address, @JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION)  BracketType bracketType, @JsonKey(unknownEnumValue: TeamMode.team5v5)  TeamMode teamMode,  String description,  String rules,  DateTime startDate, @JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED)  TournamentStatus status,  ParticipantsInfo participants,  List<PrizeItem> prizes,  List<TournamentEntryItem> entries)?  $default,) {final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.discipline,_that.isOnline,_that.address,_that.bracketType,_that.teamMode,_that.description,_that.rules,_that.startDate,_that.status,_that.participants,_that.prizes,_that.entries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TournamentModel implements TournamentModel {
  const _TournamentModel({required this.id, required this.title, required this.imageUrl, @JsonKey(unknownEnumValue: Discipline.DOTA2) required this.discipline, required this.isOnline, this.address, @JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION) required this.bracketType, @JsonKey(unknownEnumValue: TeamMode.team5v5) required this.teamMode, required this.description, required this.rules, required this.startDate, @JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED) required this.status, required this.participants, final  List<PrizeItem> prizes = const [], final  List<TournamentEntryItem> entries = const []}): _prizes = prizes,_entries = entries;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TournamentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.discipline, discipline) || other.discipline == discipline)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.address, address) || other.address == address)&&(identical(other.bracketType, bracketType) || other.bracketType == bracketType)&&(identical(other.teamMode, teamMode) || other.teamMode == teamMode)&&(identical(other.description, description) || other.description == description)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.participants, participants) || other.participants == participants)&&const DeepCollectionEquality().equals(other._prizes, _prizes)&&const DeepCollectionEquality().equals(other._entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,discipline,isOnline,address,bracketType,teamMode,description,rules,startDate,status,participants,const DeepCollectionEquality().hash(_prizes),const DeepCollectionEquality().hash(_entries));

@override
String toString() {
  return 'TournamentModel(id: $id, title: $title, imageUrl: $imageUrl, discipline: $discipline, isOnline: $isOnline, address: $address, bracketType: $bracketType, teamMode: $teamMode, description: $description, rules: $rules, startDate: $startDate, status: $status, participants: $participants, prizes: $prizes, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$TournamentModelCopyWith<$Res> implements $TournamentModelCopyWith<$Res> {
  factory _$TournamentModelCopyWith(_TournamentModel value, $Res Function(_TournamentModel) _then) = __$TournamentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String imageUrl,@JsonKey(unknownEnumValue: Discipline.DOTA2) Discipline discipline, bool isOnline, String? address,@JsonKey(unknownEnumValue: BracketType.SINGLE_ELIMINATION) BracketType bracketType,@JsonKey(unknownEnumValue: TeamMode.team5v5) TeamMode teamMode, String description, String rules, DateTime startDate,@JsonKey(unknownEnumValue: TournamentStatus.ANNOUNCED) TournamentStatus status, ParticipantsInfo participants, List<PrizeItem> prizes, List<TournamentEntryItem> entries
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? discipline = null,Object? isOnline = null,Object? address = freezed,Object? bracketType = null,Object? teamMode = null,Object? description = null,Object? rules = null,Object? startDate = null,Object? status = null,Object? participants = null,Object? prizes = null,Object? entries = null,}) {
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
as List<TournamentEntryItem>,
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

// dart format on
