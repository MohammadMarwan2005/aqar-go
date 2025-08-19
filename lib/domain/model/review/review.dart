import '../profile/user_profile.dart';

class Review {
  final int id;
  final int adId;
  final int userId;
  final double rating;
  final String? comment;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserProfile? userProfile;

  Review({
    required this.id,
    required this.adId,
    required this.userId,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.userProfile,
  });
}
