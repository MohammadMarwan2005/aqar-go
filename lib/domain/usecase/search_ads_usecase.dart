import 'package:aqar_go/domain/model/search/search_filter_settings.dart';
import 'package:aqar_go/domain/repo/ad_repo.dart';

import '../model/ad/ad.dart';
import '../model/resource.dart';

class SearchAdsUsecase {
  final AdRepo _adRepo;

  SearchAdsUsecase(this._adRepo);

  Future<Resource<List<Ad>>> call({
    required int page,
    required int pageSize,
    required SearchFilterSettings searchFilterSettings,
  }) {
    return _adRepo.searchAds(
      page: page,
      pageSize: pageSize,
      searchFilterSettings: searchFilterSettings,
    );
  }
}
