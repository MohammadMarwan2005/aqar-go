import 'package:aqar_go/data/model/property/property_data.dart';
import 'package:aqar_go/domain/model/ad/ad.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ad_data.g.dart';

@JsonSerializable()
class AdData {
  final int id;

  @JsonKey(name: 'property_id')
  final int propertyId;

  @JsonKey(name: 'is_active')
  final bool isActive;

  final int views;

  @JsonKey(name: 'start_date')
  final String startDate;

  @JsonKey(name: 'end_date')
  final String endDate;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'property')
  final PropertyData propertyData;

  AdData({
    required this.id,
    required this.propertyId,
    required this.propertyData,
    required this.isActive,
    required this.views,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdData.fromJson(Map<String, dynamic> json) => _$AdDataFromJson(json);

  Map<String, dynamic> toJson() => _$AdDataToJson(this);

  // todo: when the back-end returns the date in a unified format just remove the DateTime.now()
  Ad toDomain() {
    return Ad(
      id: id,
      isActive: isActive,
      views: views,
      creationDateUTC: DateTime.tryParse(startDate) ?? DateTime.now(),
      expirationDateUTC: DateTime.tryParse(endDate) ?? DateTime.now(),
      property: propertyData.toDomain(),
    );
  }
}
