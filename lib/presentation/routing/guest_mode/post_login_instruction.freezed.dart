// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_login_instruction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostLoginInstruction {
  String get redirectionRoute => throw _privateConstructorUsedError;
  Object? get itsExtras => throw _privateConstructorUsedError;

  /// Create a copy of PostLoginInstruction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostLoginInstructionCopyWith<PostLoginInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostLoginInstructionCopyWith<$Res> {
  factory $PostLoginInstructionCopyWith(PostLoginInstruction value,
          $Res Function(PostLoginInstruction) then) =
      _$PostLoginInstructionCopyWithImpl<$Res, PostLoginInstruction>;
  @useResult
  $Res call({String redirectionRoute, Object? itsExtras});
}

/// @nodoc
class _$PostLoginInstructionCopyWithImpl<$Res,
        $Val extends PostLoginInstruction>
    implements $PostLoginInstructionCopyWith<$Res> {
  _$PostLoginInstructionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostLoginInstruction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redirectionRoute = null,
    Object? itsExtras = freezed,
  }) {
    return _then(_value.copyWith(
      redirectionRoute: null == redirectionRoute
          ? _value.redirectionRoute
          : redirectionRoute // ignore: cast_nullable_to_non_nullable
              as String,
      itsExtras: freezed == itsExtras ? _value.itsExtras : itsExtras,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostLoginInstructionImplCopyWith<$Res>
    implements $PostLoginInstructionCopyWith<$Res> {
  factory _$$PostLoginInstructionImplCopyWith(_$PostLoginInstructionImpl value,
          $Res Function(_$PostLoginInstructionImpl) then) =
      __$$PostLoginInstructionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String redirectionRoute, Object? itsExtras});
}

/// @nodoc
class __$$PostLoginInstructionImplCopyWithImpl<$Res>
    extends _$PostLoginInstructionCopyWithImpl<$Res, _$PostLoginInstructionImpl>
    implements _$$PostLoginInstructionImplCopyWith<$Res> {
  __$$PostLoginInstructionImplCopyWithImpl(_$PostLoginInstructionImpl _value,
      $Res Function(_$PostLoginInstructionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostLoginInstruction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redirectionRoute = null,
    Object? itsExtras = freezed,
  }) {
    return _then(_$PostLoginInstructionImpl(
      redirectionRoute: null == redirectionRoute
          ? _value.redirectionRoute
          : redirectionRoute // ignore: cast_nullable_to_non_nullable
              as String,
      itsExtras: freezed == itsExtras ? _value.itsExtras : itsExtras,
    ));
  }
}

/// @nodoc

class _$PostLoginInstructionImpl implements _PostLoginInstruction {
  _$PostLoginInstructionImpl({required this.redirectionRoute, this.itsExtras});

  @override
  final String redirectionRoute;
  @override
  final Object? itsExtras;

  @override
  String toString() {
    return 'PostLoginInstruction(redirectionRoute: $redirectionRoute, itsExtras: $itsExtras)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostLoginInstructionImpl &&
            (identical(other.redirectionRoute, redirectionRoute) ||
                other.redirectionRoute == redirectionRoute) &&
            const DeepCollectionEquality().equals(other.itsExtras, itsExtras));
  }

  @override
  int get hashCode => Object.hash(runtimeType, redirectionRoute,
      const DeepCollectionEquality().hash(itsExtras));

  /// Create a copy of PostLoginInstruction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostLoginInstructionImplCopyWith<_$PostLoginInstructionImpl>
      get copyWith =>
          __$$PostLoginInstructionImplCopyWithImpl<_$PostLoginInstructionImpl>(
              this, _$identity);
}

abstract class _PostLoginInstruction implements PostLoginInstruction {
  factory _PostLoginInstruction(
      {required final String redirectionRoute,
      final Object? itsExtras}) = _$PostLoginInstructionImpl;

  @override
  String get redirectionRoute;
  @override
  Object? get itsExtras;

  /// Create a copy of PostLoginInstruction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostLoginInstructionImplCopyWith<_$PostLoginInstructionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
