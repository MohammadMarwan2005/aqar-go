import 'package:aqar_go/domain/model/review/review.dart';
import 'package:json_annotation/json_annotation.dart';

import '../profile/user/data_user.dart';

part 'data_review.g.dart';

@JsonSerializable()
class DataReview {
  final int id;
  @JsonKey(name: 'property_id')
  final int propertyId;
  @JsonKey(name: 'user_id')
  final int userId;
  final String rating;
  final String? comment;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'user')
  final DataUser? user;

  DataReview({
    required this.id,
    required this.propertyId,
    required this.userId,
    required this.rating,
    this.comment,
    this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DataReview.fromJson(Map<String, dynamic> json) =>
      _$DataReviewFromJson(json);

  Map<String, dynamic> toJson() => _$DataReviewToJson(this);

  Review toDomain() => Review(
    id: id,
    propertyId: propertyId,
    userId: userId,
    comment: comment,
    userProfile: user?.toDomain(),
    rating: double.parse(rating),
    createdAt: DateTime.tryParse(createdAt),
    updatedAt: DateTime.tryParse(updatedAt),
  );
}
