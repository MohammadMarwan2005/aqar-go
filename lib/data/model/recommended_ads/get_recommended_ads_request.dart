import 'package:json_annotation/json_annotation.dart';

part 'get_recommended_ads_request.g.dart';

@JsonSerializable()
class GetRecommendedAdsRequest {
  @JsonKey(name: "num")
  final int pageSize;

  GetRecommendedAdsRequest({required this.pageSize});

  factory GetRecommendedAdsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRecommendedAdsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetRecommendedAdsRequestToJson(this);
}
