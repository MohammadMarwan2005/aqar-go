import 'package:aqar_go/domain/model/resource.dart';
import 'package:aqar_go/domain/model/review/review.dart';

abstract class ReviewRepo {
  Future<Resource<Review>> createReview(Review review);
  Future<Resource<Review>> updateReview(Review review);
  Future<Resource<void>> deleteReview(int reviewId);
  Future<Resource<List<Review>>> getReviewsByAdId(int adId);
}