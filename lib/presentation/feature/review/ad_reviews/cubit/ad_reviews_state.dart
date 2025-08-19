part of 'ad_reviews_cubit.dart';

@freezed
sealed class AdReviewsState with _$AdReviewsState {
  const factory AdReviewsState.loading() = _Loading;

  const factory AdReviewsState.success(List<Review> reviews, Review? myReview) = _Success;

  const factory AdReviewsState.error(DomainError error) = _Error;
}

extension AdReviewsStateX on AdReviewsState {
  R when<R>({
    required R Function() loading,
    required R Function(List<Review> reviews, Review? myReview) success,
    required R Function(DomainError error) error,
  }) {
    switch (this) {
      case _Loading():
        return loading();
      case _Success(reviews: var reviews, myReview: var myReview):
        return success(reviews, myReview);
      case _Error(error: var domainError):
        return error(domainError);
    }
  }
}
