import 'package:json_annotation/json_annotation.dart';

part 'create_ad_response.g.dart';

@JsonSerializable()
class CreateAdResponse {
  final int id;

  @JsonKey(name: 'property_id')
  final int propertyId;

  @JsonKey(name: 'start_date')
  final String startDate;

  @JsonKey(name: 'end_date')
  final String endDate;

  @JsonKey(name: 'created_at')
  final String createdAt;

  CreateAdResponse({
    required this.id,
    required this.propertyId,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
  });

  factory CreateAdResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAdResponseToJson(this);
}
