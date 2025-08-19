import 'package:aqar_go/presentation/feature/review/ad_reviews/cubit/ad_reviews_cubit.dart';
import 'package:aqar_go/presentation/helper/date_time_helper.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:aqar_go/presentation/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/review/review.dart';
import '../../../widgets/error_message.dart';
import '../../../widgets/expandable_text.dart';
import '../../ad_details/ad_details_screen.dart';

class AdReviewsSection extends StatelessWidget {
  const AdReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdReviewsCubit, AdReviewsState>(
      builder:
          (context, state) => state.when(
            loading: () => LoadingScreen(),
            success: (reviews) => _AdReviewsContent(reviews: reviews),
            error:
                (error) => ErrorMessage(
                  error: error,
                  onTryAgain: () {
                    context.read<AdReviewsCubit>().fetchReviews();
                  },
                ),
          ),
    );
  }
}

class _AdReviewsContent extends StatelessWidget {
  final List<Review> reviews;

  const _AdReviewsContent({required this.reviews});

  @override
  Widget build(BuildContext context) {
    if(reviews.isEmpty) {
      return Center(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Text("No reviews for this ad yet!".tr(context)),
      ));
    }
    return ListView.builder(
      itemCount: reviews.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _ReviewCard(review: reviews[index]),
          ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final Review review;

  const _ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final formattedDate = review.updatedAt?.toLocal().formatToShortDate();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ProfileImage(imageUrl: review.userProfile?.imageUrl, radius: 40),
            const SizedBox(width: 8),
            Text(
              review.userProfile?.fullName ?? "Unknown User".tr(context),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            _StarsRating(rating: review.rating, size: 16),
            if (formattedDate != null) ...[
              SizedBox(width: 8),
              Text(formattedDate),
            ],
          ],
        ),
        // if this comment is very long, we should show the first of it, with "see more", when the user clicks on the comment, it should expand
        if (review.comment != null) ...[
          const SizedBox(height: 2),
          ExpandableText(text: review.comment!),
        ],
      ],
    );
  }
}

class _StarsRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final Color color;
  final double size;

  const _StarsRating({
    required this.rating,
    this.starCount = 5,
    this.color = Colors.amber,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        final starIndex = index + 1;
        // Full star
        if (rating >= starIndex) {
          return Icon(Icons.star, color: color, size: size);
        }
        // Partial star
        else if (rating > index && rating < starIndex) {
          final fractional = rating - index; // e.g. 0.9 for 3.9
          return Stack(
            children: [
              Icon(Icons.star_border, color: color, size: size),
              ClipRect(
                clipper: _FractionClipper(fractional),
                child: Icon(Icons.star, color: color, size: size),
              ),
            ],
          );
        }
        // Empty star
        else {
          return Icon(Icons.star_border, color: color, size: size);
        }
      }),
    );
  }
}

class _FractionClipper extends CustomClipper<Rect> {
  final double fraction; // between 0.0 and 1.0
  _FractionClipper(this.fraction);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * fraction, size.height);
  }

  @override
  bool shouldReclip(_FractionClipper oldClipper) {
    return oldClipper.fraction != fraction;
  }
}
