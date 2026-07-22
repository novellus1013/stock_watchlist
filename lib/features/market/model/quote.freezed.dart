// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Quote {

 String get date; String get code; int get close; int get change; double get changeRate; int get volume; int get marketCap;
/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteCopyWith<Quote> get copyWith => _$QuoteCopyWithImpl<Quote>(this as Quote, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Quote&&(identical(other.date, date) || other.date == date)&&(identical(other.code, code) || other.code == code)&&(identical(other.close, close) || other.close == close)&&(identical(other.change, change) || other.change == change)&&(identical(other.changeRate, changeRate) || other.changeRate == changeRate)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap));
}


@override
int get hashCode => Object.hash(runtimeType,date,code,close,change,changeRate,volume,marketCap);

@override
String toString() {
  return 'Quote(date: $date, code: $code, close: $close, change: $change, changeRate: $changeRate, volume: $volume, marketCap: $marketCap)';
}


}

/// @nodoc
abstract mixin class $QuoteCopyWith<$Res>  {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) _then) = _$QuoteCopyWithImpl;
@useResult
$Res call({
 String date, String code, int close, int change, double changeRate, int volume, int marketCap
});




}
/// @nodoc
class _$QuoteCopyWithImpl<$Res>
    implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._self, this._then);

  final Quote _self;
  final $Res Function(Quote) _then;

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? code = null,Object? close = null,Object? change = null,Object? changeRate = null,Object? volume = null,Object? marketCap = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as int,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as int,changeRate: null == changeRate ? _self.changeRate : changeRate // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Quote].
extension QuotePatterns on Quote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Quote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Quote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Quote value)  $default,){
final _that = this;
switch (_that) {
case _Quote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Quote value)?  $default,){
final _that = this;
switch (_that) {
case _Quote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  String code,  int close,  int change,  double changeRate,  int volume,  int marketCap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Quote() when $default != null:
return $default(_that.date,_that.code,_that.close,_that.change,_that.changeRate,_that.volume,_that.marketCap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  String code,  int close,  int change,  double changeRate,  int volume,  int marketCap)  $default,) {final _that = this;
switch (_that) {
case _Quote():
return $default(_that.date,_that.code,_that.close,_that.change,_that.changeRate,_that.volume,_that.marketCap);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  String code,  int close,  int change,  double changeRate,  int volume,  int marketCap)?  $default,) {final _that = this;
switch (_that) {
case _Quote() when $default != null:
return $default(_that.date,_that.code,_that.close,_that.change,_that.changeRate,_that.volume,_that.marketCap);case _:
  return null;

}
}

}

/// @nodoc


class _Quote extends Quote {
  const _Quote({required this.date, required this.code, required this.close, required this.change, required this.changeRate, required this.volume, required this.marketCap}): super._();
  

@override final  String date;
@override final  String code;
@override final  int close;
@override final  int change;
@override final  double changeRate;
@override final  int volume;
@override final  int marketCap;

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteCopyWith<_Quote> get copyWith => __$QuoteCopyWithImpl<_Quote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Quote&&(identical(other.date, date) || other.date == date)&&(identical(other.code, code) || other.code == code)&&(identical(other.close, close) || other.close == close)&&(identical(other.change, change) || other.change == change)&&(identical(other.changeRate, changeRate) || other.changeRate == changeRate)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.marketCap, marketCap) || other.marketCap == marketCap));
}


@override
int get hashCode => Object.hash(runtimeType,date,code,close,change,changeRate,volume,marketCap);

@override
String toString() {
  return 'Quote(date: $date, code: $code, close: $close, change: $change, changeRate: $changeRate, volume: $volume, marketCap: $marketCap)';
}


}

/// @nodoc
abstract mixin class _$QuoteCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$QuoteCopyWith(_Quote value, $Res Function(_Quote) _then) = __$QuoteCopyWithImpl;
@override @useResult
$Res call({
 String date, String code, int close, int change, double changeRate, int volume, int marketCap
});




}
/// @nodoc
class __$QuoteCopyWithImpl<$Res>
    implements _$QuoteCopyWith<$Res> {
  __$QuoteCopyWithImpl(this._self, this._then);

  final _Quote _self;
  final $Res Function(_Quote) _then;

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? code = null,Object? close = null,Object? change = null,Object? changeRate = null,Object? volume = null,Object? marketCap = null,}) {
  return _then(_Quote(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,close: null == close ? _self.close : close // ignore: cast_nullable_to_non_nullable
as int,change: null == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as int,changeRate: null == changeRate ? _self.changeRate : changeRate // ignore: cast_nullable_to_non_nullable
as double,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,marketCap: null == marketCap ? _self.marketCap : marketCap // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
