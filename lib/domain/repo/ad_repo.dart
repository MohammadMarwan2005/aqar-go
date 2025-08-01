import 'package:aqar_go/domain/model/resource.dart';

import '../model/ad/ad.dart';

abstract class AdRepo {
  Future<Resource<Ad>> getAdById();
  Future<Resource<List<Ad>>> getMyAds();
  /// returns the ad id, todo: we will make return the ad
  Future<Resource<int>> createAd(int propertyId);
  Future<Resource<void>> activateAllAds();
}