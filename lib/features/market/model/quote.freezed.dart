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

/// @nodoc
mixin _$QuoteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuoteState()';
}


}

/// @nodoc
class $QuoteStateCopyWith<$Res>  {
$QuoteStateCopyWith(QuoteState _, $Res Function(QuoteState) __);
}


/// Adds pattern-matching-related methods to [QuoteState].
extension QuoteStatePatterns on QuoteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( QuoteAvailable value)?  available,TResult Function( QuoteUnavailable value)?  unavailable,required TResult orElse(),}){
final _that = this;
switch (_that) {
case QuoteAvailable() when available != null:
return available(_that);case QuoteUnavailable() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( QuoteAvailable value)  available,required TResult Function( QuoteUnavailable value)  unavailable,}){
final _that = this;
switch (_that) {
case QuoteAvailable():
return available(_that);case QuoteUnavailable():
return unavailable(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( QuoteAvailable value)?  available,TResult? Function( QuoteUnavailable value)?  unavailable,}){
final _that = this;
switch (_that) {
case QuoteAvailable() when available != null:
return available(_that);case QuoteUnavailable() when unavailable != null:
return unavailable(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Quote quote)?  available,TResult Function( UnavailableReason reason,  String? nearestTradingDay)?  unavailable,required TResult orElse(),}) {final _that = this;
switch (_that) {
case QuoteAvailable() when available != null:
return available(_that.quote);case QuoteUnavailable() when unavailable != null:
return unavailable(_that.reason,_that.nearestTradingDay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Quote quote)  available,required TResult Function( UnavailableReason reason,  String? nearestTradingDay)  unavailable,}) {final _that = this;
switch (_that) {
case QuoteAvailable():
return available(_that.quote);case QuoteUnavailable():
return unavailable(_that.reason,_that.nearestTradingDay);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Quote quote)?  available,TResult? Function( UnavailableReason reason,  String? nearestTradingDay)?  unavailable,}) {final _that = this;
switch (_that) {
case QuoteAvailable() when available != null:
return available(_that.quote);case QuoteUnavailable() when unavailable != null:
return unavailable(_that.reason,_that.nearestTradingDay);case _:
  return null;

}
}

}

/// @nodoc


class QuoteAvailable implements QuoteState {
  const QuoteAvailable(this.quote);
  

 final  Quote quote;

/// Create a copy of QuoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteAvailableCopyWith<QuoteAvailable> get copyWith => _$QuoteAvailableCopyWithImpl<QuoteAvailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteAvailable&&(identical(other.quote, quote) || other.quote == quote));
}


@override
int get hashCode => Object.hash(runtimeType,quote);

@override
String toString() {
  return 'QuoteState.available(quote: $quote)';
}


}

/// @nodoc
abstract mixin class $QuoteAvailableCopyWith<$Res> implements $QuoteStateCopyWith<$Res> {
  factory $QuoteAvailableCopyWith(QuoteAvailable value, $Res Function(QuoteAvailable) _then) = _$QuoteAvailableCopyWithImpl;
@useResult
$Res call({
 Quote quote
});


$QuoteCopyWith<$Res> get quote;

}
/// @nodoc
class _$QuoteAvailableCopyWithImpl<$Res>
    implements $QuoteAvailableCopyWith<$Res> {
  _$QuoteAvailableCopyWithImpl(this._self, this._then);

  final QuoteAvailable _self;
  final $Res Function(QuoteAvailable) _then;

/// Create a copy of QuoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quote = null,}) {
  return _then(QuoteAvailable(
null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as Quote,
  ));
}

/// Create a copy of QuoteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteCopyWith<$Res> get quote {
  
  return $QuoteCopyWith<$Res>(_self.quote, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}

/// @nodoc


class QuoteUnavailable implements QuoteState {
  const QuoteUnavailable(this.reason, {this.nearestTradingDay});
  

 final  UnavailableReason reason;
 final  String? nearestTradingDay;

/// Create a copy of QuoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteUnavailableCopyWith<QuoteUnavailable> get copyWith => _$QuoteUnavailableCopyWithImpl<QuoteUnavailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteUnavailable&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.nearestTradingDay, nearestTradingDay) || other.nearestTradingDay == nearestTradingDay));
}


@override
int get hashCode => Object.hash(runtimeType,reason,nearestTradingDay);

@override
String toString() {
  return 'QuoteState.unavailable(reason: $reason, nearestTradingDay: $nearestTradingDay)';
}


}

/// @nodoc
abstract mixin class $QuoteUnavailableCopyWith<$Res> implements $QuoteStateCopyWith<$Res> {
  factory $QuoteUnavailableCopyWith(QuoteUnavailable value, $Res Function(QuoteUnavailable) _then) = _$QuoteUnavailableCopyWithImpl;
@useResult
$Res call({
 UnavailableReason reason, String? nearestTradingDay
});




}
/// @nodoc
class _$QuoteUnavailableCopyWithImpl<$Res>
    implements $QuoteUnavailableCopyWith<$Res> {
  _$QuoteUnavailableCopyWithImpl(this._self, this._then);

  final QuoteUnavailable _self;
  final $Res Function(QuoteUnavailable) _then;

/// Create a copy of QuoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? nearestTradingDay = freezed,}) {
  return _then(QuoteUnavailable(
null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as UnavailableReason,nearestTradingDay: freezed == nearestTradingDay ? _self.nearestTradingDay : nearestTradingDay // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
