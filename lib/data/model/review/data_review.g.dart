// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataReview _$DataReviewFromJson(Map<String, dynamic> json) => DataReview(
  id: (json['id'] as num).toInt(),
  propertyId: (json['property_id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  rating: json['rating'] as String,
  comment: json['comment'] as String?,
  user:
      json['user'] == null
          ? null
          : DataUser.fromJson(json['user'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$DataReviewToJson(DataReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_id': instance.propertyId,
      'user_id': instance.userId,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user': instance.user,
    };
