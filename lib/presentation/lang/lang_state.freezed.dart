// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lang_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LangState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LangState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LangState()';
}


}

/// @nodoc
class $LangStateCopyWith<$Res>  {
$LangStateCopyWith(LangState _, $Res Function(LangState) __);
}


/// @nodoc


class LangInitial implements LangState {
  const LangInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LangInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LangState.initial()';
}


}




/// @nodoc


class LangLoaded implements LangState {
  const LangLoaded({required this.lang});
  

 final  String lang;

/// Create a copy of LangState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LangLoadedCopyWith<LangLoaded> get copyWith => _$LangLoadedCopyWithImpl<LangLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LangLoaded&&(identical(other.lang, lang) || other.lang == lang));
}


@override
int get hashCode => Object.hash(runtimeType,lang);

@override
String toString() {
  return 'LangState.loaded(lang: $lang)';
}


}

/// @nodoc
abstract mixin class $LangLoadedCopyWith<$Res> implements $LangStateCopyWith<$Res> {
  factory $LangLoadedCopyWith(LangLoaded value, $Res Function(LangLoaded) _then) = _$LangLoadedCopyWithImpl;
@useResult
$Res call({
 String lang
});




}
/// @nodoc
class _$LangLoadedCopyWithImpl<$Res>
    implements $LangLoadedCopyWith<$Res> {
  _$LangLoadedCopyWithImpl(this._self, this._then);

  final LangLoaded _self;
  final $Res Function(LangLoaded) _then;

/// Create a copy of LangState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lang = null,}) {
  return _then(LangLoaded(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
