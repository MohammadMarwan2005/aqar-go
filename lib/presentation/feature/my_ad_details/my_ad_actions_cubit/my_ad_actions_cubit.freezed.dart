// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_ad_actions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyAdActionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyAdActionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyAdActionsState()';
}


}

/// @nodoc
class $MyAdActionsStateCopyWith<$Res>  {
$MyAdActionsStateCopyWith(MyAdActionsState _, $Res Function(MyAdActionsState) __);
}


/// @nodoc


class _Initial implements MyAdActionsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyAdActionsState.initial()';
}


}




/// @nodoc


class _Loading implements MyAdActionsState {
  const _Loading(this.myAdAction);
  

 final  MyAdAction myAdAction;

/// Create a copy of MyAdActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.myAdAction, myAdAction) || other.myAdAction == myAdAction));
}


@override
int get hashCode => Object.hash(runtimeType,myAdAction);

@override
String toString() {
  return 'MyAdActionsState.loading(myAdAction: $myAdAction)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $MyAdActionsStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@useResult
$Res call({
 MyAdAction myAdAction
});




}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of MyAdActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? myAdAction = null,}) {
  return _then(_Loading(
null == myAdAction ? _self.myAdAction : myAdAction // ignore: cast_nullable_to_non_nullable
as MyAdAction,
  ));
}


}

/// @nodoc


class _Success implements MyAdActionsState {
  const _Success(this.myAdAction);
  

 final  MyAdAction myAdAction;

/// Create a copy of MyAdActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.myAdAction, myAdAction) || other.myAdAction == myAdAction));
}


@override
int get hashCode => Object.hash(runtimeType,myAdAction);

@override
String toString() {
  return 'MyAdActionsState.success(myAdAction: $myAdAction)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $MyAdActionsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 MyAdAction myAdAction
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of MyAdActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? myAdAction = null,}) {
  return _then(_Success(
null == myAdAction ? _self.myAdAction : myAdAction // ignore: cast_nullable_to_non_nullable
as MyAdAction,
  ));
}


}

/// @nodoc


class _Error implements MyAdActionsState {
  const _Error(this.error, this.myAdAction);
  

 final  DomainError error;
 final  MyAdAction myAdAction;

/// Create a copy of MyAdActionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.error, error) || other.error == error)&&(identical(other.myAdAction, myAdAction) || other.myAdAction == myAdAction));
}


@override
int get hashCode => Object.hash(runtimeType,error,myAdAction);

@override
String toString() {
  return 'MyAdActionsState.error(error: $error, myAdAction: $myAdAction)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $MyAdActionsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 DomainError error, MyAdAction myAdAction
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of MyAdActionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? myAdAction = null,}) {
  return _then(_Error(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as DomainError,null == myAdAction ? _self.myAdAction : myAdAction // ignore: cast_nullable_to_non_nullable
as MyAdAction,
  ));
}


}

// dart format on
