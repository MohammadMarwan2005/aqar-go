import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/property.dart';
import 'data_furnished_type.dart';

part 'apartment_data.g.dart';

@JsonSerializable()
class ApartmentData {
  final int floor;
  final int rooms;
  final int bathrooms;
  final int bedrooms;
  @JsonKey(name: 'has_elevator')
  final bool hasElevator;
  @JsonKey(name: 'has_alternative_power')
  final bool hasAlternativePower;
  @JsonKey(name: 'has_garage')
  final bool hasGarage;
  final bool furnished;
  @JsonKey(name: 'furnished_type')
  final String furnishedType;

  ApartmentData({
    required this.floor,
    required this.rooms,
    required this.bathrooms,
    required this.bedrooms,
    required this.hasElevator,
    required this.hasAlternativePower,
    required this.hasGarage,
    required this.furnished,
    required this.furnishedType,
  });

  factory ApartmentData.fromJson(Map<String, dynamic> json) =>
      _$ApartmentDataFromJson(json);

  Map<String, dynamic> toJson() => _$ApartmentDataToJson(this);

  static ApartmentData fromDomain(Apartment apartment) => ApartmentData(
    floor: apartment.floor,
    rooms: apartment.rooms,
    bathrooms: apartment.bathrooms,
    bedrooms: apartment.bedrooms,
    hasElevator: apartment.hasElevator,
    hasAlternativePower: apartment.hasAlternativePower,
    hasGarage: apartment.hasGarage,
    furnished: apartment.furnished,
    furnishedType: DataFurnishedType.fromDomain(apartment.furnishedType).backendValue,
  );

  Apartment toDomain() => Apartment(
    floor: floor,
    rooms: rooms,
    bathrooms: bathrooms,
    bedrooms: bedrooms,
    hasElevator: hasElevator,
    hasAlternativePower: hasAlternativePower,
    hasGarage: hasGarage,
    furnished: furnished,
    furnishedType: DataFurnishedType.fromString(furnishedType).toDomain(),
  );
}
