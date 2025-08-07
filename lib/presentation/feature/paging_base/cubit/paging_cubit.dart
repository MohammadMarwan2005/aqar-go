import 'package:aqar_go/domain/model/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/model/domain_error.dart';

part 'paging_state.dart';

part 'paging_cubit.freezed.dart';

abstract class PagingCubit<T> extends Cubit<PagingState<T>> {
  late PagingState<T> firstState;

  PagingCubit(super.initialState) {
    firstState = state;
    fetchNextPageItems();
  }

  abstract int pageSize;
  int page = 1;
  bool _isLoading = false;

  /// return list of items
  /// if end return empty list
  Future<Resource<List<T>>> getItems(int page);

  resetState() {
    _isLoading = false;
    page = 1;
    emit(firstState);
    fetchNextPageItems();
  }

  fetchNextPageItems() async {
    if (state.hasReachedEnd || _isLoading) {
      return;
    }

    emit(PagingState.loading(state.getCurrentLoadedItems(), page, false));
    _isLoading = true;
    final response = await getItems(page);
    response.when(
      onSuccess: (successData) {
        page++;
        final hasReachedEnd = successData.isEmpty;
        emit(
          PagingState.loaded(
            state.getCurrentLoadedItems() + successData,
            page,
            hasReachedEnd,
          ),
        );
      },
      onError: (error) {
        emit(
          PagingState.error(state.getCurrentLoadedItems(), error, page, false),
        );
      },
    );
    _isLoading = false;
  }
}
