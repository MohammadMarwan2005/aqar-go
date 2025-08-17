// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportState {

 ReportReason? get selectedReason;
/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportStateCopyWith<ReportState> get copyWith => _$ReportStateCopyWithImpl<ReportState>(this as ReportState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportState&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason));
}


@override
int get hashCode => Object.hash(runtimeType,selectedReason);

@override
String toString() {
  return 'ReportState(selectedReason: $selectedReason)';
}


}

/// @nodoc
abstract mixin class $ReportStateCopyWith<$Res>  {
  factory $ReportStateCopyWith(ReportState value, $Res Function(ReportState) _then) = _$ReportStateCopyWithImpl;
@useResult
$Res call({
 ReportReason? selectedReason
});




}
/// @nodoc
class _$ReportStateCopyWithImpl<$Res>
    implements $ReportStateCopyWith<$Res> {
  _$ReportStateCopyWithImpl(this._self, this._then);

  final ReportState _self;
  final $Res Function(ReportState) _then;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedReason = freezed,}) {
  return _then(_self.copyWith(
selectedReason: freezed == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as ReportReason?,
  ));
}

}


/// @nodoc


class _Initial implements ReportState {
  const _Initial(this.selectedReason);
  

@override final  ReportReason? selectedReason;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason));
}


@override
int get hashCode => Object.hash(runtimeType,selectedReason);

@override
String toString() {
  return 'ReportState.initial(selectedReason: $selectedReason)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $ReportStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 ReportReason? selectedReason
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedReason = freezed,}) {
  return _then(_Initial(
freezed == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as ReportReason?,
  ));
}


}

/// @nodoc


class _Loading implements ReportState {
  const _Loading(this.selectedReason);
  

@override final  ReportReason? selectedReason;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason));
}


@override
int get hashCode => Object.hash(runtimeType,selectedReason);

@override
String toString() {
  return 'ReportState.loading(selectedReason: $selectedReason)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $ReportStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 ReportReason? selectedReason
});




}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedReason = freezed,}) {
  return _then(_Loading(
freezed == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as ReportReason?,
  ));
}


}

/// @nodoc


class _Error implements ReportState {
  const _Error(this.error, this.selectedReason);
  

 final  DomainError error;
@override final  ReportReason? selectedReason;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.error, error) || other.error == error)&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason));
}


@override
int get hashCode => Object.hash(runtimeType,error,selectedReason);

@override
String toString() {
  return 'ReportState.error(error: $error, selectedReason: $selectedReason)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ReportStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 DomainError error, ReportReason? selectedReason
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? selectedReason = freezed,}) {
  return _then(_Error(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as DomainError,freezed == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as ReportReason?,
  ));
}


}

/// @nodoc


class _Success implements ReportState {
  const _Success(this.selectedReason);
  

@override final  ReportReason? selectedReason;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason));
}


@override
int get hashCode => Object.hash(runtimeType,selectedReason);

@override
String toString() {
  return 'ReportState.success(selectedReason: $selectedReason)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $ReportStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 ReportReason? selectedReason
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of ReportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedReason = freezed,}) {
  return _then(_Success(
freezed == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as ReportReason?,
  ));
}


}

// dart format on
