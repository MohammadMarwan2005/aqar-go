import 'package:aqar_go/data/model/activate_selected_ads/activate_selected_ads_request.dart';
import 'package:aqar_go/data/model/ad/ad_data.dart';
import 'package:aqar_go/domain/model/ad/ad.dart';
import 'package:aqar_go/domain/model/resource.dart';

import '../../domain/repo/ad_repo.dart';
import '../api/api_service.dart';
import '../api/safe_api_caller.dart';
import '../model/ad/request/create_ad_request.dart';
import '../model/ad/response/create_ad_response.dart';
import '../model/api_response.dart';

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
  Future<Resource<Ad>> getAdById() {
    // TODO: implement getAdById
    throw UnimplementedError();
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
        return _apiService.activateSelectedAds(ActivateSelectedAdsRequest(all: 1, ads: []));
      },
      dataToDomain: (data) {
        return;
      },
    );
  }
}
