// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_update_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUpdateReviewRequest _$CreateUpdateReviewRequestFromJson(
  Map<String, dynamic> json,
) => CreateUpdateReviewRequest(
  adId: (json['ad_id'] as num?)?.toInt(),
  rating: json['rating'] as String,
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$CreateUpdateReviewRequestToJson(
  CreateUpdateReviewRequest instance,
) => <String, dynamic>{
  'ad_id': instance.adId,
  'rating': instance.rating,
  'comment': instance.comment,
};
