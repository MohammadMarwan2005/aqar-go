import 'package:json_annotation/json_annotation.dart';

part 'create_ad_request.g.dart';

@JsonSerializable()
class CreateAdRequest {
  @JsonKey(name: 'property_id')
  final int propertyId;

  CreateAdRequest({required this.propertyId});

  factory CreateAdRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAdRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAdRequestToJson(this);
}
