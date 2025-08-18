import 'package:aqar_go/domain/model/report/report_reason.dart';
import 'package:aqar_go/domain/model/resource.dart';

import '../model/ad/ad.dart';
import '../model/search/search_filter_settings.dart';

abstract class AdRepo {
  Future<Resource<Ad>> getAdById(int adId);

  Future<Resource<List<Ad>>> getMyAds();

  Future<Resource<List<Ad>>> getNearToYouAds({
    required int page,
    required int pageSize,
    required double long,
    required double lat,
  });

  Future<Resource<List<Ad>>> getRecommendedAds({
    required int page,
    required int pageSize,
  });

  Future<Resource<List<Ad>>> getSimilarAds({
    required int adId,
    required int page,
    required int pageSize,
  });

  Future<Resource<int>> createAd(int propertyId);

  Future<Resource<void>> activateAllAds();

  Future<Resource<void>> activateAd(int adId);

  Future<Resource<void>> deactivateAd(int adId);

  Future<Resource<void>> deleteAd(int adId);

  Future<Resource<List<Ad>>> searchAds({
    required int page,
    required int pageSize,
    required SearchFilterSettings searchFilterSettings,
  });

  Future<Resource<void>> reportAd(
    int adId,
    ReportReason reason, {
    String? description,
  });

  Future<Resource<void>> notifyMe(
    SearchFilterSettings searchFilterSettings,
  );
}
