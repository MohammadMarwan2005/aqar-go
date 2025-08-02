import 'package:json_annotation/json_annotation.dart';

part 'activate_selected_ads_request.g.dart';

@JsonSerializable()
class ActivateSelectedAdsRequest {
  final int all;
  final List<int> ads;

  ActivateSelectedAdsRequest({
    required this.all,
    required this.ads,
  });

  factory ActivateSelectedAdsRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivateSelectedAdsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ActivateSelectedAdsRequestToJson(this);
}
