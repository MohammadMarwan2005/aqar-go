import 'package:aqar_go/presentation/feature/review/ad_reviews/cubit/ad_reviews_cubit.dart';
import 'package:aqar_go/presentation/helper/navigation_helper.dart';
import 'package:aqar_go/presentation/helper/ui_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/app_button.dart';
import 'package:aqar_go/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../widgets/error_message.dart';
import '../../../widgets/loading_screen.dart';
import '../../../widgets/screen_horizontal_padding.dart';
import 'cubit/my_review_cubit.dart';

class MyReviewScreen extends StatelessWidget {
  const MyReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyReviewCubit>();
    return Scaffold(
      appBar: AppBar(title: Text("My Review".tr(context))),
      body: SafeArea(
        child: ScreenPadding(
          child: BlocConsumer<MyReviewCubit, MyReviewState>(
            listener: (context, state) {
              state.when(
                loading: () {},
                success: (review, isDelete) {
                  if (!cubit.firstTime) {
                    String message = "";
                    if (cubit.isUpdate) {
                      context.read<AdReviewsCubit>().fetchReviews();
                      if (isDelete) {
                        message = "Review deleted successfully!".tr(context);
                      } else {
                        message = "Review updated successfully!".tr(context);
                      }
                    } else {
                      message = "Review submitted successfully!".tr(context);
                    }
                    context.showMySnackBar(message);
                    context.popRoute();
                  }
                },
                error: (error) {
                  // cubit.removeError();
                },
              );
            },
            builder: (context, state) {
              return state.when(
                loading: () => const LoadingScreen(),
                error:
                    (domainError) => ErrorMessage(
                      error: domainError,
                      detailsWidget:
                          (details) => Column(
                            children: details.map((e) => Text(e)).toList(),
                          ),
                      onTryAgain: () {
                        cubit.removeError();
                      },
                    ),
                success:
                    (review, isDelete) => _MyReviewContent(
                      commentController: cubit.commentController,
                      initialRating: cubit.myRatingValueNotifier.value,
                      onRatingUpdate: cubit.onRatingUpdate,
                    ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _MyReviewContent extends StatelessWidget {
  final TextEditingController commentController;
  final double initialRating;
  final Function(double rating) onRatingUpdate;

  const _MyReviewContent({
    required this.commentController,
    required this.initialRating,
    required this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyReviewCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: initialRating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: onRatingUpdate,
        ),
        const SizedBox(height: 16),
        AppTextField(
          textEditingController: commentController,
          labelText: "Comment (Optional)".tr(context),
        ),
        const SizedBox(height: 64),
        AppButton(
          onPressed: () {
            context.read<MyReviewCubit>().review();
          },
          text: cubit.isUpdate ? "Update".tr(context) : "Submit".tr(context),
        ),
        if (cubit.isUpdate) ...[
          const SizedBox(height: 16),
          AppButton(
            isSecondary: true,
            onPressed: () {
              context.read<MyReviewCubit>().deleteReview();
            },
            text: "Delete Review".tr(context),
          ),
        ],
      ],
    );
  }
}
