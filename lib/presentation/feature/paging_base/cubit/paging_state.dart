part of 'paging_cubit.dart';

@freezed
sealed class PagingState<T> with _$PagingState<T> {
  const factory PagingState.loading(
    List<T> oldData,
    int page,
    bool hasReachedEnd,
  ) = _Loading<T>;

  const factory PagingState.loaded(
    List<T> items,
    int page,
    bool hasReachedEnd,
  ) = _Loaded<T>;

  const factory PagingState.error(
    List<T> oldData,
    DomainError error,
    int page,
    bool hasReachedEnd,
  ) = _Error<T>;
}

extension PagingStateExtension<T> on PagingState<T> {
  R when<R>({
    required R Function(List<T> items, int page, bool hasReachedEnd) loaded,
    required R Function(List<T> oldData, int page, bool hasReachedEnd) loading,
    required R Function(
      List<T> oldData,
      DomainError error,
      int page,
      bool hasReachedEnd,
    )
    error,
  }) {
    switch (this) {
      case _Loaded(
        items: var items,
        page: var page,
        hasReachedEnd: var hasReachedEnd,
      ):
        return loaded(items, page, hasReachedEnd);
      case _Error(
        oldData: var oldData,
        error: var domainError,
        page: var page,
        hasReachedEnd: var hasReachedEnd,
      ):
        return error(oldData, domainError, page, hasReachedEnd);
      case _Loading(
        oldData: var oldData,
        page: var page,
        hasReachedEnd: var hasReachedEnd,
      ):
        return loading(oldData, page, hasReachedEnd);
    }
  }

  List<T> getCurrentLoadedItems() {
    return when(
      loaded: (items, page, hasReachedEnd) => items,
      loading: (oldData, page, hasReachedEnd) => oldData,
      error: (oldData, error, page, hasReachedEnd) => oldData,
    );
  }

  bool isError() => this is _Error;
}
