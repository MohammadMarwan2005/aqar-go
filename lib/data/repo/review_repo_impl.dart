import 'package:aqar_go/data/api/api_service.dart';
import 'package:aqar_go/data/model/review/data_review.dart';
import 'package:aqar_go/data/model/review/request/create_update_review_request.dart';
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
  Future<Resource<Review>> createReview({
    required double rating,
    required String comment,
    required int adId,
  }) {
    final request = CreateUpdateReviewRequest(
      adId: adId,
      rating: rating.toString(),
      comment: comment,
    );
    return _safeAPICaller.call<Review, APIResponse<DataReview>>(
      apiCall: () {
        return _apiService.createReview(request);
      },
      dataToDomain: (data) {
        return data.data.toDomain();
      },
    );
  }

  @override
  Future<Resource<Review>> updateReview({
    required double rating,
    required String comment,
    required int reviewId,
  }) {
    final request = CreateUpdateReviewRequest(
      rating: rating.toString(),
      comment: comment,
    );
    return _safeAPICaller.call<Review, APIResponse<DataReview>>(
      apiCall: () {
        return _apiService.updateReview(request, reviewId);
      },
      dataToDomain: (data) {
        return data.data.toDomain();
      },
    );
  }

  @override
  Future<Resource<void>> deleteReview(int reviewId) {
    return _safeAPICaller.call<void, APIResponse<dynamic>>(
      apiCall: () {
        return _apiService.deleteReview(reviewId);
      },
      dataToDomain: (data) {
        return;
      },
    );
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
  Future<Resource<Review?>> getMyReview(int adId) async {
    return _safeAPICaller.call<Review?, APIResponse<List<DataReview>>>(
      apiCall: () {
        return _apiService.getMyReview(adId);
      },
      dataToDomain: (data) {
        return data.data.firstOrNull?.toDomain();
      },
    );
  }
}
