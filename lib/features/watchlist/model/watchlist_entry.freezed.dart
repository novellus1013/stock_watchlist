// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchlistEntry {

 String get code;// 표시 전용
 String get name; DateTime get addedAt;
/// Create a copy of WatchlistEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistEntryCopyWith<WatchlistEntry> get copyWith => _$WatchlistEntryCopyWithImpl<WatchlistEntry>(this as WatchlistEntry, _$identity);

  /// Serializes this WatchlistEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistEntry&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,addedAt);

@override
String toString() {
  return 'WatchlistEntry(code: $code, name: $name, addedAt: $addedAt)';
}


}

/// @nodoc
abstract mixin class $WatchlistEntryCopyWith<$Res>  {
  factory $WatchlistEntryCopyWith(WatchlistEntry value, $Res Function(WatchlistEntry) _then) = _$WatchlistEntryCopyWithImpl;
@useResult
$Res call({
 String code, String name, DateTime addedAt
});




}
/// @nodoc
class _$WatchlistEntryCopyWithImpl<$Res>
    implements $WatchlistEntryCopyWith<$Res> {
  _$WatchlistEntryCopyWithImpl(this._self, this._then);

  final WatchlistEntry _self;
  final $Res Function(WatchlistEntry) _then;

/// Create a copy of WatchlistEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? addedAt = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchlistEntry].
extension WatchlistEntryPatterns on WatchlistEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchlistEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchlistEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchlistEntry value)  $default,){
final _that = this;
switch (_that) {
case _WatchlistEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchlistEntry value)?  $default,){
final _that = this;
switch (_that) {
case _WatchlistEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  DateTime addedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchlistEntry() when $default != null:
return $default(_that.code,_that.name,_that.addedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  DateTime addedAt)  $default,) {final _that = this;
switch (_that) {
case _WatchlistEntry():
return $default(_that.code,_that.name,_that.addedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  DateTime addedAt)?  $default,) {final _that = this;
switch (_that) {
case _WatchlistEntry() when $default != null:
return $default(_that.code,_that.name,_that.addedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchlistEntry implements WatchlistEntry {
  const _WatchlistEntry({required this.code, required this.name, required this.addedAt});
  factory _WatchlistEntry.fromJson(Map<String, dynamic> json) => _$WatchlistEntryFromJson(json);

@override final  String code;
// 표시 전용
@override final  String name;
@override final  DateTime addedAt;

/// Create a copy of WatchlistEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistEntryCopyWith<_WatchlistEntry> get copyWith => __$WatchlistEntryCopyWithImpl<_WatchlistEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchlistEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistEntry&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,addedAt);

@override
String toString() {
  return 'WatchlistEntry(code: $code, name: $name, addedAt: $addedAt)';
}


}

/// @nodoc
abstract mixin class _$WatchlistEntryCopyWith<$Res> implements $WatchlistEntryCopyWith<$Res> {
  factory _$WatchlistEntryCopyWith(_WatchlistEntry value, $Res Function(_WatchlistEntry) _then) = __$WatchlistEntryCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, DateTime addedAt
});




}
/// @nodoc
class __$WatchlistEntryCopyWithImpl<$Res>
    implements _$WatchlistEntryCopyWith<$Res> {
  __$WatchlistEntryCopyWithImpl(this._self, this._then);

  final _WatchlistEntry _self;
  final $Res Function(_WatchlistEntry) _then;

/// Create a copy of WatchlistEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? addedAt = null,}) {
  return _then(_WatchlistEntry(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
