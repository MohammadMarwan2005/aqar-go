import 'package:aqar_go/domain/model/resource.dart';
import 'package:aqar_go/domain/usecase/search_ads_usecase.dart';
import 'package:aqar_go/presentation/feature/paging_base/cubit/paging_cubit.dart';

import '../../../../../domain/model/ad/ad.dart';
import '../../../../../domain/model/search/search_filter_settings.dart';

class SearchResultsCubit extends PagingCubit<Ad> {
  final SearchFilterSettings searchFilterSettings;
  final SearchAdsUsecase _searchUsecase;

  SearchResultsCubit(this._searchUsecase, this.searchFilterSettings)
    : super(PagingState.loading([], 1, false));

  @override
  int pageSize = 10;

  @override
  Future<Resource<List<Ad>>> getItems(int page) {
    return _searchUsecase(
      page: page,
      pageSize: pageSize,
      searchFilterSettings: searchFilterSettings,
    );
  }
}
