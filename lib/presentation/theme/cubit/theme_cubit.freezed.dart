// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeState()';
}


}

/// @nodoc
class $ThemeStateCopyWith<$Res>  {
$ThemeStateCopyWith(ThemeState _, $Res Function(ThemeState) __);
}


/// @nodoc


class _ThemeInitial implements ThemeState {
  const _ThemeInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeState.initial()';
}


}




/// @nodoc


class _ThemeLoaded implements ThemeState {
  const _ThemeLoaded({this.theme});
  

 final  CubitTheme? theme;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeLoadedCopyWith<_ThemeLoaded> get copyWith => __$ThemeLoadedCopyWithImpl<_ThemeLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeLoaded&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,theme);

@override
String toString() {
  return 'ThemeState.loaded(theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$ThemeLoadedCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$ThemeLoadedCopyWith(_ThemeLoaded value, $Res Function(_ThemeLoaded) _then) = __$ThemeLoadedCopyWithImpl;
@useResult
$Res call({
 CubitTheme? theme
});




}
/// @nodoc
class __$ThemeLoadedCopyWithImpl<$Res>
    implements _$ThemeLoadedCopyWith<$Res> {
  __$ThemeLoadedCopyWithImpl(this._self, this._then);

  final _ThemeLoaded _self;
  final $Res Function(_ThemeLoaded) _then;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? theme = freezed,}) {
  return _then(_ThemeLoaded(
theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as CubitTheme?,
  ));
}


}

// dart format on
