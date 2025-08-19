import 'package:aqar_go/domain/model/resource.dart';
import 'package:aqar_go/domain/model/review/review.dart';

abstract class ReviewRepo {
  Future<Resource<Review>> createReview({
    required double rating,
    required String comment,
    required int adId,
  });

  Future<Resource<Review>> updateReview({
    required double rating,
    required String comment,
    required int reviewId,
  });

  Future<Resource<Review?>> getMyReview(int adId);

  Future<Resource<void>> deleteReview(int reviewId);

  Future<Resource<List<Review>>> getReviewsByAdId(int adId);
}
