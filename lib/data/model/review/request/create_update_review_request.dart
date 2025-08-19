import 'package:json_annotation/json_annotation.dart';

part 'create_update_review_request.g.dart';

@JsonSerializable()
class CreateUpdateReviewRequest {
  @JsonKey(name: 'ad_id')
  final int? adId;
  final String rating;
  final String? comment;

  CreateUpdateReviewRequest({this.adId, required this.rating, this.comment});

  factory CreateUpdateReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUpdateReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUpdateReviewRequestToJson(this);
}
