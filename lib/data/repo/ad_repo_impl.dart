import 'package:aqar_go/common/helpers/logging_helper.dart';
import 'package:aqar_go/data/model/activate_selected_ads/activate_selected_ads_request.dart';
import 'package:aqar_go/data/model/ad/ad_data.dart';
import 'package:aqar_go/data/model/favorite/favorite_ad_data.dart';
import 'package:aqar_go/data/model/near_to_you/near_to_you_request.dart';
import 'package:aqar_go/data/model/paged_response.dart';
import 'package:aqar_go/data/model/search/data_search_filter_settings.dart';
import 'package:aqar_go/domain/model/ad/ad.dart';
import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/model/report/report_reason.dart';
import 'package:aqar_go/domain/model/resource.dart';

import '../../domain/model/search/search_filter_settings.dart';
import '../../domain/repo/ad_repo.dart';
import '../api/api_service.dart';
import '../api/safe_api_caller.dart';
import '../model/ad/request/create_ad_request.dart';
import '../model/ad/response/create_ad_response.dart';
import '../model/api_response.dart';
import '../model/paging/page_request.dart';
import '../model/report/create/create_report_request.dart';
import '../model/report/data_report_reason.dart';

class AdRepoImpl extends AdRepo {
  final APIService _apiService;
  final SafeAPICaller _safeAPICaller;

  AdRepoImpl(this._apiService, this._safeAPICaller);

  @override
  Future<Resource<int>> createAd(int propertyId) {
    return _safeAPICaller.call<int, APIResponse<CreateAdResponse>>(
      apiCall: () {
        return _apiService.createAd(CreateAdRequest(propertyId: propertyId));
      },
      dataToDomain: (data) {
        return data.data.id;
      },
    );
  }

  @override
  Future<Resource<Ad>> getAdById(int adId) {
    return _safeAPICaller.call<Ad, APIResponse<AdData>>(
      apiCall: () {
        return _apiService.getAdById(adId);
      },
      dataToDomain: (data) {
        return data.data.toDomain();
      },
    );
  }

  @override
  Future<Resource<List<Ad>>> getMyAds() {
    return _safeAPICaller.call<List<Ad>, APIResponse<List<AdData>>>(
      apiCall: () {
        return _apiService.getUserAds();
      },
      dataToDomain: (data) {
        return data.data.map((adData) => adData.toDomain()).toList();
      },
    );
  }

  @override
  Future<Resource<void>> activateAllAds() {
    return _safeAPICaller.call<void, APIResponse<dynamic>>(
      apiCall: () {
        return _apiService.activateSelectedAds(
          ActivateSelectedAdsRequest(all: 1, ads: []),
        );
      },
      dataToDomain: (data) {
        return;
      },
    );
  }

  @override
  Future<Resource<void>> activateAd(int adId) {
    return _safeAPICaller.call<void, APIResponse<dynamic>>(
      apiCall: () {
        return _apiService.activateSelectedAds(
          ActivateSelectedAdsRequest(all: 0, ads: [adId]),
        );
      },
      dataToDomain: (data) {
        return;
      },
    );
  }

  @override
  Future<Resource<void>> deactivateAd(int adId) {
    return _safeAPICaller.call<void, APIResponse<dynamic>>(
      apiCall: () {
        return _apiService.deactivateAd(adId);
      },
      dataToDomain: (data) {
        return;
      },
    );
  }

  @override
  Future<Resource<void>> deleteAd(int adId) {
    return _safeAPICaller.call<void, APIResponse<dynamic>>(
      apiCall: () {
        return _apiService.deleteAd(adId);
      },
      dataToDomain: (data) {
        return;
      },
    );
  }

  @override
  Future<Resource<List<Ad>>> getNearToYouAds({
    required int page,
    required int pageSize,
    required double long,
    required double lat,
  }) {
    final request = NearToYouRequest(pageSize: pageSize, long: long, lat: lat);
    return _safeAPICaller.call<List<Ad>, APIResponse<PagedResponse<AdData>>>(
      apiCall: () {
        return _apiService.getNearToYouAds(page: page, request: request);
      },
      dataToDomain: (data) {
        return data.data.data.map((adData) => adData.toDomain()).toList();
      },
    );
  }

  @override
  Future<Resource<List<Ad>>> getRecommendedAds({
    required int page,
    required int pageSize,
  }) {
    final request = PageRequest(pageSize: pageSize);
    return _safeAPICaller.call<List<Ad>, APIResponse<PagedResponse<AdData>>>(
      apiCall: () {
        return _apiService.getRecommendedAds(page: page, request: request);
      },
      dataToDomain: (data) {
        return data.data.data.map((adData) => adData.toDomain()).toList();
      },
    );
  }

  @override
  Future<Resource<List<Ad>>> getSimilarAds({
    required int adId,
    required int page,
    required int pageSize,
  }) {
    final request = PageRequest(pageSize: pageSize);
    return _safeAPICaller.call<List<Ad>, APIResponse<PagedResponse<AdData>>>(
      apiCall: () {
        return _apiService.getSimilarAds(
          page: page,
          request: request,
          adId: adId,
        );
      },
      dataToDomain: (data) {
        return data.data.data.map((adData) => adData.toDomain()).toList();
      },
    );
  }

  @override
  Future<Resource<List<Ad>>> searchAds({
    required int page,
    required int pageSize,
    required SearchFilterSettings searchFilterSettings,
  }) async {
    final request = DataSearchFilterSettings.fromDomain(
      searchFilterSettings,
      pageSize,
    );
    debugLog(request.toJson().toString());
    return _safeAPICaller.call<List<Ad>, APIResponse<PagedResponse<AdData>>>(
      apiCall: () {
        return _apiService.search(page, request);
      },
      dataToDomain: (data) {
        return data.data.data.map((adData) => adData.toDomain()).toList();
      },
    );
  }

  @override
  Future<Resource<void>> reportAd(
    int adId,
    ReportReason reason, {
    String? description,
  }) {
    return _safeAPICaller.call<void, APIResponse<dynamic>>(
      apiCall: () {
        return _apiService.createReport(
          CreateReportRequest(
            adId: adId,
            reason: DataReportReason.fromDomain(reason).backendValue,
            description: description,
          ),
        );
      },
      dataToDomain: (data) {
        return;
      },
    );
  }

  @override
  Future<Resource<void>> notifyMe(
    SearchFilterSettings searchFilterSettings,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return Success(null);
    // return Error(DomainError.unknownError);
  }

  @override
  Future<Resource<void>> addToFavourite(int adId) async {
    return _safeAPICaller.call<void, APIResponse<dynamic>>(
      apiCall: () {
        return _apiService.addToFavorites(adId);
      },
      dataToDomain: (data) {
        return;
      },
    );
  }

  @override
  Future<Resource<List<Ad>>> getFavouriteAds({
    required int page,
    required int pageSize,
  }) async {
    return _safeAPICaller
        .call<List<Ad>, APIResponse<PagedResponse<FavoriteAdData>>>(
          apiCall: () {
            return _apiService.getFavoriteAds(page: page, pageSize: pageSize);
          },
          dataToDomain: (data) {
            return data.data.data
                .map((favoriteAdData) => favoriteAdData.ad.toDomain())
                .toList();
          },
        );
  }

  @override
  Future<Resource<void>> removeFromFavourite(int adId) async {
    return _safeAPICaller.call<void, APIResponse<dynamic>>(
      apiCall: () {
        return _apiService.removeFromFavorites(adId);
      },
      dataToDomain: (data) {
        return;
      },
    );
  }
}
