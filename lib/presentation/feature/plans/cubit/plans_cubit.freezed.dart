// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plans_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlansState {

 PlanEnum get planEnum;
/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlansStateCopyWith<PlansState> get copyWith => _$PlansStateCopyWithImpl<PlansState>(this as PlansState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlansState&&(identical(other.planEnum, planEnum) || other.planEnum == planEnum));
}


@override
int get hashCode => Object.hash(runtimeType,planEnum);

@override
String toString() {
  return 'PlansState(planEnum: $planEnum)';
}


}

/// @nodoc
abstract mixin class $PlansStateCopyWith<$Res>  {
  factory $PlansStateCopyWith(PlansState value, $Res Function(PlansState) _then) = _$PlansStateCopyWithImpl;
@useResult
$Res call({
 PlanEnum planEnum
});




}
/// @nodoc
class _$PlansStateCopyWithImpl<$Res>
    implements $PlansStateCopyWith<$Res> {
  _$PlansStateCopyWithImpl(this._self, this._then);

  final PlansState _self;
  final $Res Function(PlansState) _then;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? planEnum = null,}) {
  return _then(_self.copyWith(
planEnum: null == planEnum ? _self.planEnum : planEnum // ignore: cast_nullable_to_non_nullable
as PlanEnum,
  ));
}

}


/// @nodoc


class _Initial implements PlansState {
  const _Initial(this.planEnum);
  

@override final  PlanEnum planEnum;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.planEnum, planEnum) || other.planEnum == planEnum));
}


@override
int get hashCode => Object.hash(runtimeType,planEnum);

@override
String toString() {
  return 'PlansState.initial(planEnum: $planEnum)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $PlansStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 PlanEnum planEnum
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planEnum = null,}) {
  return _then(_Initial(
null == planEnum ? _self.planEnum : planEnum // ignore: cast_nullable_to_non_nullable
as PlanEnum,
  ));
}


}

/// @nodoc


class _Loading implements PlansState {
  const _Loading(this.planEnum);
  

@override final  PlanEnum planEnum;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.planEnum, planEnum) || other.planEnum == planEnum));
}


@override
int get hashCode => Object.hash(runtimeType,planEnum);

@override
String toString() {
  return 'PlansState.loading(planEnum: $planEnum)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $PlansStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 PlanEnum planEnum
});




}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planEnum = null,}) {
  return _then(_Loading(
null == planEnum ? _self.planEnum : planEnum // ignore: cast_nullable_to_non_nullable
as PlanEnum,
  ));
}


}

/// @nodoc


class _Error implements PlansState {
  const _Error(this.planEnum, this.error);
  

@override final  PlanEnum planEnum;
 final  DomainError error;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.planEnum, planEnum) || other.planEnum == planEnum)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,planEnum,error);

@override
String toString() {
  return 'PlansState.error(planEnum: $planEnum, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $PlansStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 PlanEnum planEnum, DomainError error
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planEnum = null,Object? error = null,}) {
  return _then(_Error(
null == planEnum ? _self.planEnum : planEnum // ignore: cast_nullable_to_non_nullable
as PlanEnum,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as DomainError,
  ));
}


}

/// @nodoc


class _Success implements PlansState {
  const _Success(this.planEnum);
  

@override final  PlanEnum planEnum;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.planEnum, planEnum) || other.planEnum == planEnum));
}


@override
int get hashCode => Object.hash(runtimeType,planEnum);

@override
String toString() {
  return 'PlansState.success(planEnum: $planEnum)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $PlansStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 PlanEnum planEnum
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of PlansState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? planEnum = null,}) {
  return _then(_Success(
null == planEnum ? _self.planEnum : planEnum // ignore: cast_nullable_to_non_nullable
as PlanEnum,
  ));
}


}

// dart format on
