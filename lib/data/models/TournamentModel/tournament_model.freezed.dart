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
mixin _$TournamentParticipants {

 int get currentParticipants; int get maxParticipants;
/// Create a copy of TournamentParticipants
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentParticipantsCopyWith<TournamentParticipants> get copyWith => _$TournamentParticipantsCopyWithImpl<TournamentParticipants>(this as TournamentParticipants, _$identity);

  /// Serializes this TournamentParticipants to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentParticipants&&(identical(other.currentParticipants, currentParticipants) || other.currentParticipants == currentParticipants)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentParticipants,maxParticipants);

@override
String toString() {
  return 'TournamentParticipants(currentParticipants: $currentParticipants, maxParticipants: $maxParticipants)';
}


}

/// @nodoc
abstract mixin class $TournamentParticipantsCopyWith<$Res>  {
  factory $TournamentParticipantsCopyWith(TournamentParticipants value, $Res Function(TournamentParticipants) _then) = _$TournamentParticipantsCopyWithImpl;
@useResult
$Res call({
 int currentParticipants, int maxParticipants
});




}
/// @nodoc
class _$TournamentParticipantsCopyWithImpl<$Res>
    implements $TournamentParticipantsCopyWith<$Res> {
  _$TournamentParticipantsCopyWithImpl(this._self, this._then);

  final TournamentParticipants _self;
  final $Res Function(TournamentParticipants) _then;

/// Create a copy of TournamentParticipants
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentParticipants = null,Object? maxParticipants = null,}) {
  return _then(_self.copyWith(
currentParticipants: null == currentParticipants ? _self.currentParticipants : currentParticipants // ignore: cast_nullable_to_non_nullable
as int,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TournamentParticipants].
extension TournamentParticipantsPatterns on TournamentParticipants {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TournamentParticipants value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TournamentParticipants() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TournamentParticipants value)  $default,){
final _that = this;
switch (_that) {
case _TournamentParticipants():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TournamentParticipants value)?  $default,){
final _that = this;
switch (_that) {
case _TournamentParticipants() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentParticipants,  int maxParticipants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TournamentParticipants() when $default != null:
return $default(_that.currentParticipants,_that.maxParticipants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentParticipants,  int maxParticipants)  $default,) {final _that = this;
switch (_that) {
case _TournamentParticipants():
return $default(_that.currentParticipants,_that.maxParticipants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentParticipants,  int maxParticipants)?  $default,) {final _that = this;
switch (_that) {
case _TournamentParticipants() when $default != null:
return $default(_that.currentParticipants,_that.maxParticipants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TournamentParticipants implements TournamentParticipants {
  const _TournamentParticipants({required this.currentParticipants, required this.maxParticipants});
  factory _TournamentParticipants.fromJson(Map<String, dynamic> json) => _$TournamentParticipantsFromJson(json);

@override final  int currentParticipants;
@override final  int maxParticipants;

/// Create a copy of TournamentParticipants
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TournamentParticipantsCopyWith<_TournamentParticipants> get copyWith => __$TournamentParticipantsCopyWithImpl<_TournamentParticipants>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TournamentParticipantsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TournamentParticipants&&(identical(other.currentParticipants, currentParticipants) || other.currentParticipants == currentParticipants)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentParticipants,maxParticipants);

@override
String toString() {
  return 'TournamentParticipants(currentParticipants: $currentParticipants, maxParticipants: $maxParticipants)';
}


}

/// @nodoc
abstract mixin class _$TournamentParticipantsCopyWith<$Res> implements $TournamentParticipantsCopyWith<$Res> {
  factory _$TournamentParticipantsCopyWith(_TournamentParticipants value, $Res Function(_TournamentParticipants) _then) = __$TournamentParticipantsCopyWithImpl;
@override @useResult
$Res call({
 int currentParticipants, int maxParticipants
});




}
/// @nodoc
class __$TournamentParticipantsCopyWithImpl<$Res>
    implements _$TournamentParticipantsCopyWith<$Res> {
  __$TournamentParticipantsCopyWithImpl(this._self, this._then);

  final _TournamentParticipants _self;
  final $Res Function(_TournamentParticipants) _then;

/// Create a copy of TournamentParticipants
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentParticipants = null,Object? maxParticipants = null,}) {
  return _then(_TournamentParticipants(
currentParticipants: null == currentParticipants ? _self.currentParticipants : currentParticipants // ignore: cast_nullable_to_non_nullable
as int,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TournamentPrizes {

 String? get firstPlace; String? get secondPlace; String? get thirdPlace;
/// Create a copy of TournamentPrizes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentPrizesCopyWith<TournamentPrizes> get copyWith => _$TournamentPrizesCopyWithImpl<TournamentPrizes>(this as TournamentPrizes, _$identity);

  /// Serializes this TournamentPrizes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentPrizes&&(identical(other.firstPlace, firstPlace) || other.firstPlace == firstPlace)&&(identical(other.secondPlace, secondPlace) || other.secondPlace == secondPlace)&&(identical(other.thirdPlace, thirdPlace) || other.thirdPlace == thirdPlace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstPlace,secondPlace,thirdPlace);

@override
String toString() {
  return 'TournamentPrizes(firstPlace: $firstPlace, secondPlace: $secondPlace, thirdPlace: $thirdPlace)';
}


}

/// @nodoc
abstract mixin class $TournamentPrizesCopyWith<$Res>  {
  factory $TournamentPrizesCopyWith(TournamentPrizes value, $Res Function(TournamentPrizes) _then) = _$TournamentPrizesCopyWithImpl;
@useResult
$Res call({
 String? firstPlace, String? secondPlace, String? thirdPlace
});




}
/// @nodoc
class _$TournamentPrizesCopyWithImpl<$Res>
    implements $TournamentPrizesCopyWith<$Res> {
  _$TournamentPrizesCopyWithImpl(this._self, this._then);

  final TournamentPrizes _self;
  final $Res Function(TournamentPrizes) _then;

/// Create a copy of TournamentPrizes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstPlace = freezed,Object? secondPlace = freezed,Object? thirdPlace = freezed,}) {
  return _then(_self.copyWith(
firstPlace: freezed == firstPlace ? _self.firstPlace : firstPlace // ignore: cast_nullable_to_non_nullable
as String?,secondPlace: freezed == secondPlace ? _self.secondPlace : secondPlace // ignore: cast_nullable_to_non_nullable
as String?,thirdPlace: freezed == thirdPlace ? _self.thirdPlace : thirdPlace // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TournamentPrizes].
extension TournamentPrizesPatterns on TournamentPrizes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TournamentPrizes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TournamentPrizes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TournamentPrizes value)  $default,){
final _that = this;
switch (_that) {
case _TournamentPrizes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TournamentPrizes value)?  $default,){
final _that = this;
switch (_that) {
case _TournamentPrizes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? firstPlace,  String? secondPlace,  String? thirdPlace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TournamentPrizes() when $default != null:
return $default(_that.firstPlace,_that.secondPlace,_that.thirdPlace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? firstPlace,  String? secondPlace,  String? thirdPlace)  $default,) {final _that = this;
switch (_that) {
case _TournamentPrizes():
return $default(_that.firstPlace,_that.secondPlace,_that.thirdPlace);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? firstPlace,  String? secondPlace,  String? thirdPlace)?  $default,) {final _that = this;
switch (_that) {
case _TournamentPrizes() when $default != null:
return $default(_that.firstPlace,_that.secondPlace,_that.thirdPlace);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TournamentPrizes implements TournamentPrizes {
  const _TournamentPrizes({this.firstPlace, this.secondPlace, this.thirdPlace});
  factory _TournamentPrizes.fromJson(Map<String, dynamic> json) => _$TournamentPrizesFromJson(json);

@override final  String? firstPlace;
@override final  String? secondPlace;
@override final  String? thirdPlace;

/// Create a copy of TournamentPrizes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TournamentPrizesCopyWith<_TournamentPrizes> get copyWith => __$TournamentPrizesCopyWithImpl<_TournamentPrizes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TournamentPrizesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TournamentPrizes&&(identical(other.firstPlace, firstPlace) || other.firstPlace == firstPlace)&&(identical(other.secondPlace, secondPlace) || other.secondPlace == secondPlace)&&(identical(other.thirdPlace, thirdPlace) || other.thirdPlace == thirdPlace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstPlace,secondPlace,thirdPlace);

@override
String toString() {
  return 'TournamentPrizes(firstPlace: $firstPlace, secondPlace: $secondPlace, thirdPlace: $thirdPlace)';
}


}

/// @nodoc
abstract mixin class _$TournamentPrizesCopyWith<$Res> implements $TournamentPrizesCopyWith<$Res> {
  factory _$TournamentPrizesCopyWith(_TournamentPrizes value, $Res Function(_TournamentPrizes) _then) = __$TournamentPrizesCopyWithImpl;
@override @useResult
$Res call({
 String? firstPlace, String? secondPlace, String? thirdPlace
});




}
/// @nodoc
class __$TournamentPrizesCopyWithImpl<$Res>
    implements _$TournamentPrizesCopyWith<$Res> {
  __$TournamentPrizesCopyWithImpl(this._self, this._then);

  final _TournamentPrizes _self;
  final $Res Function(_TournamentPrizes) _then;

/// Create a copy of TournamentPrizes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstPlace = freezed,Object? secondPlace = freezed,Object? thirdPlace = freezed,}) {
  return _then(_TournamentPrizes(
firstPlace: freezed == firstPlace ? _self.firstPlace : firstPlace // ignore: cast_nullable_to_non_nullable
as String?,secondPlace: freezed == secondPlace ? _self.secondPlace : secondPlace // ignore: cast_nullable_to_non_nullable
as String?,thirdPlace: freezed == thirdPlace ? _self.thirdPlace : thirdPlace // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TournamentModel {

 String get id; String get title; String get imageUrl; String get discipline; int get prizePool; String get type; String? get address; String get format; String get formatVersus; String get description; String get rules; DateTime get startDate; TournamentStatus get status; List<String> get registeredPlayerIds; TournamentParticipants get participants; TournamentPrizes get prizes;
/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentModelCopyWith<TournamentModel> get copyWith => _$TournamentModelCopyWithImpl<TournamentModel>(this as TournamentModel, _$identity);

  /// Serializes this TournamentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.discipline, discipline) || other.discipline == discipline)&&(identical(other.prizePool, prizePool) || other.prizePool == prizePool)&&(identical(other.type, type) || other.type == type)&&(identical(other.address, address) || other.address == address)&&(identical(other.format, format) || other.format == format)&&(identical(other.formatVersus, formatVersus) || other.formatVersus == formatVersus)&&(identical(other.description, description) || other.description == description)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.registeredPlayerIds, registeredPlayerIds)&&(identical(other.participants, participants) || other.participants == participants)&&(identical(other.prizes, prizes) || other.prizes == prizes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,discipline,prizePool,type,address,format,formatVersus,description,rules,startDate,status,const DeepCollectionEquality().hash(registeredPlayerIds),participants,prizes);

@override
String toString() {
  return 'TournamentModel(id: $id, title: $title, imageUrl: $imageUrl, discipline: $discipline, prizePool: $prizePool, type: $type, address: $address, format: $format, formatVersus: $formatVersus, description: $description, rules: $rules, startDate: $startDate, status: $status, registeredPlayerIds: $registeredPlayerIds, participants: $participants, prizes: $prizes)';
}


}

/// @nodoc
abstract mixin class $TournamentModelCopyWith<$Res>  {
  factory $TournamentModelCopyWith(TournamentModel value, $Res Function(TournamentModel) _then) = _$TournamentModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String imageUrl, String discipline, int prizePool, String type, String? address, String format, String formatVersus, String description, String rules, DateTime startDate, TournamentStatus status, List<String> registeredPlayerIds, TournamentParticipants participants, TournamentPrizes prizes
});


$TournamentParticipantsCopyWith<$Res> get participants;$TournamentPrizesCopyWith<$Res> get prizes;

}
/// @nodoc
class _$TournamentModelCopyWithImpl<$Res>
    implements $TournamentModelCopyWith<$Res> {
  _$TournamentModelCopyWithImpl(this._self, this._then);

  final TournamentModel _self;
  final $Res Function(TournamentModel) _then;

/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? discipline = null,Object? prizePool = null,Object? type = null,Object? address = freezed,Object? format = null,Object? formatVersus = null,Object? description = null,Object? rules = null,Object? startDate = null,Object? status = null,Object? registeredPlayerIds = null,Object? participants = null,Object? prizes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,discipline: null == discipline ? _self.discipline : discipline // ignore: cast_nullable_to_non_nullable
as String,prizePool: null == prizePool ? _self.prizePool : prizePool // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,formatVersus: null == formatVersus ? _self.formatVersus : formatVersus // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TournamentStatus,registeredPlayerIds: null == registeredPlayerIds ? _self.registeredPlayerIds : registeredPlayerIds // ignore: cast_nullable_to_non_nullable
as List<String>,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as TournamentParticipants,prizes: null == prizes ? _self.prizes : prizes // ignore: cast_nullable_to_non_nullable
as TournamentPrizes,
  ));
}
/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TournamentParticipantsCopyWith<$Res> get participants {
  
  return $TournamentParticipantsCopyWith<$Res>(_self.participants, (value) {
    return _then(_self.copyWith(participants: value));
  });
}/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TournamentPrizesCopyWith<$Res> get prizes {
  
  return $TournamentPrizesCopyWith<$Res>(_self.prizes, (value) {
    return _then(_self.copyWith(prizes: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  String discipline,  int prizePool,  String type,  String? address,  String format,  String formatVersus,  String description,  String rules,  DateTime startDate,  TournamentStatus status,  List<String> registeredPlayerIds,  TournamentParticipants participants,  TournamentPrizes prizes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.discipline,_that.prizePool,_that.type,_that.address,_that.format,_that.formatVersus,_that.description,_that.rules,_that.startDate,_that.status,_that.registeredPlayerIds,_that.participants,_that.prizes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String imageUrl,  String discipline,  int prizePool,  String type,  String? address,  String format,  String formatVersus,  String description,  String rules,  DateTime startDate,  TournamentStatus status,  List<String> registeredPlayerIds,  TournamentParticipants participants,  TournamentPrizes prizes)  $default,) {final _that = this;
switch (_that) {
case _TournamentModel():
return $default(_that.id,_that.title,_that.imageUrl,_that.discipline,_that.prizePool,_that.type,_that.address,_that.format,_that.formatVersus,_that.description,_that.rules,_that.startDate,_that.status,_that.registeredPlayerIds,_that.participants,_that.prizes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String imageUrl,  String discipline,  int prizePool,  String type,  String? address,  String format,  String formatVersus,  String description,  String rules,  DateTime startDate,  TournamentStatus status,  List<String> registeredPlayerIds,  TournamentParticipants participants,  TournamentPrizes prizes)?  $default,) {final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.discipline,_that.prizePool,_that.type,_that.address,_that.format,_that.formatVersus,_that.description,_that.rules,_that.startDate,_that.status,_that.registeredPlayerIds,_that.participants,_that.prizes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TournamentModel implements TournamentModel {
  const _TournamentModel({required this.id, required this.title, required this.imageUrl, required this.discipline, required this.prizePool, required this.type, this.address, required this.format, required this.formatVersus, required this.description, required this.rules, required this.startDate, required this.status, final  List<String> registeredPlayerIds = const [], required this.participants, required this.prizes}): _registeredPlayerIds = registeredPlayerIds;
  factory _TournamentModel.fromJson(Map<String, dynamic> json) => _$TournamentModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String imageUrl;
@override final  String discipline;
@override final  int prizePool;
@override final  String type;
@override final  String? address;
@override final  String format;
@override final  String formatVersus;
@override final  String description;
@override final  String rules;
@override final  DateTime startDate;
@override final  TournamentStatus status;
 final  List<String> _registeredPlayerIds;
@override@JsonKey() List<String> get registeredPlayerIds {
  if (_registeredPlayerIds is EqualUnmodifiableListView) return _registeredPlayerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_registeredPlayerIds);
}

@override final  TournamentParticipants participants;
@override final  TournamentPrizes prizes;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TournamentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.discipline, discipline) || other.discipline == discipline)&&(identical(other.prizePool, prizePool) || other.prizePool == prizePool)&&(identical(other.type, type) || other.type == type)&&(identical(other.address, address) || other.address == address)&&(identical(other.format, format) || other.format == format)&&(identical(other.formatVersus, formatVersus) || other.formatVersus == formatVersus)&&(identical(other.description, description) || other.description == description)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._registeredPlayerIds, _registeredPlayerIds)&&(identical(other.participants, participants) || other.participants == participants)&&(identical(other.prizes, prizes) || other.prizes == prizes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,discipline,prizePool,type,address,format,formatVersus,description,rules,startDate,status,const DeepCollectionEquality().hash(_registeredPlayerIds),participants,prizes);

@override
String toString() {
  return 'TournamentModel(id: $id, title: $title, imageUrl: $imageUrl, discipline: $discipline, prizePool: $prizePool, type: $type, address: $address, format: $format, formatVersus: $formatVersus, description: $description, rules: $rules, startDate: $startDate, status: $status, registeredPlayerIds: $registeredPlayerIds, participants: $participants, prizes: $prizes)';
}


}

/// @nodoc
abstract mixin class _$TournamentModelCopyWith<$Res> implements $TournamentModelCopyWith<$Res> {
  factory _$TournamentModelCopyWith(_TournamentModel value, $Res Function(_TournamentModel) _then) = __$TournamentModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String imageUrl, String discipline, int prizePool, String type, String? address, String format, String formatVersus, String description, String rules, DateTime startDate, TournamentStatus status, List<String> registeredPlayerIds, TournamentParticipants participants, TournamentPrizes prizes
});


@override $TournamentParticipantsCopyWith<$Res> get participants;@override $TournamentPrizesCopyWith<$Res> get prizes;

}
/// @nodoc
class __$TournamentModelCopyWithImpl<$Res>
    implements _$TournamentModelCopyWith<$Res> {
  __$TournamentModelCopyWithImpl(this._self, this._then);

  final _TournamentModel _self;
  final $Res Function(_TournamentModel) _then;

/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? discipline = null,Object? prizePool = null,Object? type = null,Object? address = freezed,Object? format = null,Object? formatVersus = null,Object? description = null,Object? rules = null,Object? startDate = null,Object? status = null,Object? registeredPlayerIds = null,Object? participants = null,Object? prizes = null,}) {
  return _then(_TournamentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,discipline: null == discipline ? _self.discipline : discipline // ignore: cast_nullable_to_non_nullable
as String,prizePool: null == prizePool ? _self.prizePool : prizePool // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,formatVersus: null == formatVersus ? _self.formatVersus : formatVersus // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TournamentStatus,registeredPlayerIds: null == registeredPlayerIds ? _self._registeredPlayerIds : registeredPlayerIds // ignore: cast_nullable_to_non_nullable
as List<String>,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as TournamentParticipants,prizes: null == prizes ? _self.prizes : prizes // ignore: cast_nullable_to_non_nullable
as TournamentPrizes,
  ));
}

/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TournamentParticipantsCopyWith<$Res> get participants {
  
  return $TournamentParticipantsCopyWith<$Res>(_self.participants, (value) {
    return _then(_self.copyWith(participants: value));
  });
}/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TournamentPrizesCopyWith<$Res> get prizes {
  
  return $TournamentPrizesCopyWith<$Res>(_self.prizes, (value) {
    return _then(_self.copyWith(prizes: value));
  });
}
}

// dart format on
