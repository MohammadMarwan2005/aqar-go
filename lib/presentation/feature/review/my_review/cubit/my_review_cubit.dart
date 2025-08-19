import 'package:aqar_go/domain/repo/review_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/model/domain_error.dart';
import '../../../../../domain/model/resource.dart';
import '../../../../../domain/model/review/review.dart';

part 'my_review_cubit.freezed.dart';
part 'my_review_state.dart';

class MyReviewCubit extends Cubit<MyReviewState> {
  final int adId;
  final ReviewRepo _reviewRepo;

  MyReviewCubit(this.adId, this._reviewRepo)
    : super(const MyReviewState.loading()) {
    fetchCurrentReview(firstTime: true);
  }

  Review? cachedReview;
  bool firstTime = true;

  get isUpdate => cachedReview != null;

  TextEditingController commentController = TextEditingController();
  final ValueNotifier<double> myRatingValueNotifier = ValueNotifier(0);

  fetchCurrentReview({bool firstTime = false}) async {
    emit(const MyReviewState.loading());
    final result = await _reviewRepo.getMyReview(adId);
    _handleResult(result, firstTime: firstTime);
  }

  deleteReview() async {
    emit(const MyReviewState.loading());
    if (cachedReview == null) return;

    final response = await _reviewRepo.deleteReview(cachedReview!.id);
    final Resource<Review> reviewResource = response.when(
      onSuccess: (successData) => Success(cachedReview!),
      onError: (error) => Error(error),
    );
    _handleResult(reviewResource, isDelete: true);
  }

  removeError() {
    emit(MyReviewState.success(cachedReview));
    firstTime = true;
  }

  _handleResult(
    Resource<Review?> result, {
    bool firstTime = false,
    bool isDelete = false,
  }) {
    result.when(
      onSuccess: (successData) {
        this.firstTime = firstTime;
        emit(MyReviewState.success(successData, isDelete: isDelete));
        if (successData == null) return;
        _fillValues(successData.rating, successData.comment);
        cachedReview = successData;
      },
      onError: (error) {
        emit(MyReviewState.error(error));
      },
    );
  }

  _fillValues(double rating, String? comment) {
    myRatingValueNotifier.value = rating;
    commentController.text = comment ?? '';
  }

  onRatingUpdate(double rating) {
    myRatingValueNotifier.value = rating;
  }

  review() async {
    emit(const MyReviewState.loading());
    final response = await switch (cachedReview) {
      null => _reviewRepo.createReview(
        adId: adId,
        rating: myRatingValueNotifier.value,
        comment: commentController.text,
      ),
      Review review => _reviewRepo.updateReview(
        reviewId: review.id,
        rating: myRatingValueNotifier.value,
        comment: commentController.text,
      ),
    };

    _handleResult(response);
  }

  @override
  Future<void> close() {
    myRatingValueNotifier.dispose();
    commentController.dispose();
    return super.close();
  }
}
