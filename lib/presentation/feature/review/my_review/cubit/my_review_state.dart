part of 'my_review_cubit.dart';

@freezed
sealed class MyReviewState with _$MyReviewState {
  const factory MyReviewState.loading() = _Loading;

  const factory MyReviewState.success(
      Review? review,
      {@Default(false) bool isDelete}
      ) = _Success;

  const factory MyReviewState.error(DomainError error) = _Error;
}

extension MyReviewStateX on MyReviewState {
  R when<R>({
    required R Function() loading,
    required R Function(Review? review, bool isDelete) success,
    required R Function(DomainError error) error,
  }) {
    switch (this) {
      case _Loading():
        return loading();
      case _Success(review: var review, isDelete: var isDelete):
        return success(review, isDelete);
      case _Error(error: var domainError):
        return error(domainError);
    }
  }

  bool isSuccess() => this is _Success;
}