// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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
