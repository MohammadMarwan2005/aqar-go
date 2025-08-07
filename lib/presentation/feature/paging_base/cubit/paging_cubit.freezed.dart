// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PagingState<T> {

 int get page; bool get hasReachedEnd;
/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagingStateCopyWith<T, PagingState<T>> get copyWith => _$PagingStateCopyWithImpl<T, PagingState<T>>(this as PagingState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagingState<T>&&(identical(other.page, page) || other.page == page)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd));
}


@override
int get hashCode => Object.hash(runtimeType,page,hasReachedEnd);

@override
String toString() {
  return 'PagingState<$T>(page: $page, hasReachedEnd: $hasReachedEnd)';
}


}

/// @nodoc
abstract mixin class $PagingStateCopyWith<T,$Res>  {
  factory $PagingStateCopyWith(PagingState<T> value, $Res Function(PagingState<T>) _then) = _$PagingStateCopyWithImpl;
@useResult
$Res call({
 int page, bool hasReachedEnd
});




}
/// @nodoc
class _$PagingStateCopyWithImpl<T,$Res>
    implements $PagingStateCopyWith<T, $Res> {
  _$PagingStateCopyWithImpl(this._self, this._then);

  final PagingState<T> _self;
  final $Res Function(PagingState<T>) _then;

/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? hasReachedEnd = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasReachedEnd: null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _Loading<T> implements PagingState<T> {
  const _Loading(final  List<T> oldData, this.page, this.hasReachedEnd): _oldData = oldData;
  

 final  List<T> _oldData;
 List<T> get oldData {
  if (_oldData is EqualUnmodifiableListView) return _oldData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_oldData);
}

@override final  int page;
@override final  bool hasReachedEnd;

/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<T, _Loading<T>> get copyWith => __$LoadingCopyWithImpl<T, _Loading<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading<T>&&const DeepCollectionEquality().equals(other._oldData, _oldData)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_oldData),page,hasReachedEnd);

@override
String toString() {
  return 'PagingState<$T>.loading(oldData: $oldData, page: $page, hasReachedEnd: $hasReachedEnd)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<T,$Res> implements $PagingStateCopyWith<T, $Res> {
  factory _$LoadingCopyWith(_Loading<T> value, $Res Function(_Loading<T>) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 List<T> oldData, int page, bool hasReachedEnd
});




}
/// @nodoc
class __$LoadingCopyWithImpl<T,$Res>
    implements _$LoadingCopyWith<T, $Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading<T> _self;
  final $Res Function(_Loading<T>) _then;

/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? oldData = null,Object? page = null,Object? hasReachedEnd = null,}) {
  return _then(_Loading<T>(
null == oldData ? _self._oldData : oldData // ignore: cast_nullable_to_non_nullable
as List<T>,null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Loaded<T> implements PagingState<T> {
  const _Loaded(final  List<T> items, this.page, this.hasReachedEnd): _items = items;
  

 final  List<T> _items;
 List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int page;
@override final  bool hasReachedEnd;

/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<T, _Loaded<T>> get copyWith => __$LoadedCopyWithImpl<T, _Loaded<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded<T>&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),page,hasReachedEnd);

@override
String toString() {
  return 'PagingState<$T>.loaded(items: $items, page: $page, hasReachedEnd: $hasReachedEnd)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<T,$Res> implements $PagingStateCopyWith<T, $Res> {
  factory _$LoadedCopyWith(_Loaded<T> value, $Res Function(_Loaded<T>) _then) = __$LoadedCopyWithImpl;
@override @useResult
$Res call({
 List<T> items, int page, bool hasReachedEnd
});




}
/// @nodoc
class __$LoadedCopyWithImpl<T,$Res>
    implements _$LoadedCopyWith<T, $Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded<T> _self;
  final $Res Function(_Loaded<T>) _then;

/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? page = null,Object? hasReachedEnd = null,}) {
  return _then(_Loaded<T>(
null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Error<T> implements PagingState<T> {
  const _Error(final  List<T> oldData, this.error, this.page, this.hasReachedEnd): _oldData = oldData;
  

 final  List<T> _oldData;
 List<T> get oldData {
  if (_oldData is EqualUnmodifiableListView) return _oldData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_oldData);
}

 final  DomainError error;
@override final  int page;
@override final  bool hasReachedEnd;

/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<T, _Error<T>> get copyWith => __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error<T>&&const DeepCollectionEquality().equals(other._oldData, _oldData)&&(identical(other.error, error) || other.error == error)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasReachedEnd, hasReachedEnd) || other.hasReachedEnd == hasReachedEnd));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_oldData),error,page,hasReachedEnd);

@override
String toString() {
  return 'PagingState<$T>.error(oldData: $oldData, error: $error, page: $page, hasReachedEnd: $hasReachedEnd)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T,$Res> implements $PagingStateCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 List<T> oldData, DomainError error, int page, bool hasReachedEnd
});




}
/// @nodoc
class __$ErrorCopyWithImpl<T,$Res>
    implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T> _self;
  final $Res Function(_Error<T>) _then;

/// Create a copy of PagingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? oldData = null,Object? error = null,Object? page = null,Object? hasReachedEnd = null,}) {
  return _then(_Error<T>(
null == oldData ? _self._oldData : oldData // ignore: cast_nullable_to_non_nullable
as List<T>,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as DomainError,null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,null == hasReachedEnd ? _self.hasReachedEnd : hasReachedEnd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
