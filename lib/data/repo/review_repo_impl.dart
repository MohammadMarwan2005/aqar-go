import 'package:aqar_go/data/api/api_service.dart';
import 'package:aqar_go/data/model/review/data_review.dart';
import 'package:aqar_go/domain/model/resource.dart';
import 'package:aqar_go/domain/model/review/review.dart';

import '../../domain/repo/review_repo.dart';
import '../api/safe_api_caller.dart';
import '../model/api_response.dart';

class ReviewRepoImpl extends ReviewRepo {
  final APIService _apiService;
  final SafeAPICaller _safeAPICaller;

  ReviewRepoImpl(this._apiService, this._safeAPICaller);

  @override
  Future<Resource<Review>> createReview(Review review) {
    // TODO: implement createReview
    throw UnimplementedError();
  }

  @override
  Future<Resource<void>> deleteReview(int reviewId) {
    // TODO: implement deleteReview
    throw UnimplementedError();
  }

  @override
  Future<Resource<List<Review>>> getReviewsByAdId(int adId) {
    return _safeAPICaller.call<List<Review>, APIResponse<List<DataReview>>>(
      apiCall: () {
        return _apiService.getAdReviews(adId);
      },
      dataToDomain: (data) {
        return data.data.map((adData) => adData.toDomain()).toList();
      },
    );
  }

  @override
  Future<Resource<Review>> updateReview(Review review) {
    // TODO: implement updateReview
    throw UnimplementedError();
  }

}