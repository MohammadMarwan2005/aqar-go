import 'package:aqar_go/domain/model/domain_error.dart';
import 'package:aqar_go/domain/repo/review_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/model/review/review.dart';

part 'ad_reviews_cubit.freezed.dart';
part 'ad_reviews_state.dart';

class AdReviewsCubit extends Cubit<AdReviewsState> {
  final int adId;
  final ReviewRepo _reviewRepo;

  AdReviewsCubit(this.adId, this._reviewRepo)
    : super(const AdReviewsState.loading()) {
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    emit(const AdReviewsState.loading());
    final result = await _reviewRepo.getReviewsByAdId(adId);
    final myReview = await _reviewRepo.getMyReview(adId);
    result.when(
      onSuccess: (adReviews) {
        myReview.when(
          onSuccess: (myReview) {
            emit(AdReviewsState.success(adReviews, myReview));
          },
          onError: (error) {
            emit(AdReviewsState.error(error));
          },
        );
      },
      onError: (error) {
        emit(AdReviewsState.error(error));
      },
    );
  }
}
