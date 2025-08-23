// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_favorite_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdFavoriteState {

 bool? get isFavorite;
/// Create a copy of AdFavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdFavoriteStateCopyWith<AdFavoriteState> get copyWith => _$AdFavoriteStateCopyWithImpl<AdFavoriteState>(this as AdFavoriteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdFavoriteState&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,isFavorite);

@override
String toString() {
  return 'AdFavoriteState(isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $AdFavoriteStateCopyWith<$Res>  {
  factory $AdFavoriteStateCopyWith(AdFavoriteState value, $Res Function(AdFavoriteState) _then) = _$AdFavoriteStateCopyWithImpl;
@useResult
$Res call({
 bool? isFavorite
});




}
/// @nodoc
class _$AdFavoriteStateCopyWithImpl<$Res>
    implements $AdFavoriteStateCopyWith<$Res> {
  _$AdFavoriteStateCopyWithImpl(this._self, this._then);

  final AdFavoriteState _self;
  final $Res Function(AdFavoriteState) _then;

/// Create a copy of AdFavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFavorite = freezed,}) {
  return _then(_self.copyWith(
isFavorite: freezed == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc


class _Initial implements AdFavoriteState {
  const _Initial(this.isFavorite);
  

@override final  bool? isFavorite;

/// Create a copy of AdFavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,isFavorite);

@override
String toString() {
  return 'AdFavoriteState.initial(isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $AdFavoriteStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 bool? isFavorite
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of AdFavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFavorite = freezed,}) {
  return _then(_Initial(
freezed == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class _Loading implements AdFavoriteState {
  const _Loading(this.isFavorite);
  

@override final  bool? isFavorite;

/// Create a copy of AdFavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,isFavorite);

@override
String toString() {
  return 'AdFavoriteState.loading(isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $AdFavoriteStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 bool? isFavorite
});




}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of AdFavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFavorite = freezed,}) {
  return _then(_Loading(
freezed == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc


class _Error implements AdFavoriteState {
  const _Error(this.isFavorite, this.error);
  

@override final  bool? isFavorite;
 final  DomainError error;

/// Create a copy of AdFavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isFavorite,error);

@override
String toString() {
  return 'AdFavoriteState.error(isFavorite: $isFavorite, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AdFavoriteStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 bool? isFavorite, DomainError error
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AdFavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFavorite = freezed,Object? error = null,}) {
  return _then(_Error(
freezed == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool?,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as DomainError,
  ));
}


}

/// @nodoc


class _Success implements AdFavoriteState {
  const _Success(this.isFavorite);
  

@override final  bool? isFavorite;

/// Create a copy of AdFavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,isFavorite);

@override
String toString() {
  return 'AdFavoriteState.success(isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $AdFavoriteStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 bool? isFavorite
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of AdFavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFavorite = freezed,}) {
  return _then(_Success(
freezed == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
