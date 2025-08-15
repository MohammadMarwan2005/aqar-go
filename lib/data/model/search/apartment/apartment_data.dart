part of '../data_search_filter_settings.dart';

@JsonSerializable(includeIfNull: false)
class ApartmentData implements PropertySearchFilterData {
  @JsonKey(name: 'min_floor')
  final int? minFloor;
  @JsonKey(name: 'max_floor')
  final int? maxFloor;
  @JsonKey(name: 'min_rooms')
  final int? minRooms;
  @JsonKey(name: 'max_rooms')
  final int? maxRooms;
  @JsonKey(name: 'min_bathrooms')
  final int? minBathrooms;
  @JsonKey(name: 'min_bedrooms')
  final int? minBedrooms;
  @JsonKey(name: 'max_bedrooms')
  final int? maxBedrooms;
  @JsonKey(name: 'has_alternative_power')
  final bool? hasAlternativePower;
  @JsonKey(name: 'has_garage')
  final bool? hasGarage;
  @JsonKey(name: 'has_elevator')
  final bool? hasElevator;
  final bool? furnished;
  @JsonKey(name: 'furnished_type')
  final List<String>? furnishedType;

  factory ApartmentData.fromDomain(
      SearchFilterSettings settings,
      ) => ApartmentData(
    minFloor: settings.apartmentMinFloor,
    maxFloor: settings.apartmentMaxFloor,
    minRooms: settings.apartmentMinRooms,
    maxRooms: settings.apartmentMaxRooms,
    minBedrooms: settings.apartmentMinBedrooms,
    hasAlternativePower: settings.apartmentHasAlternativePower,
    hasGarage: settings.apartmentHasGarage,
    hasElevator: settings.apartmentHasElevator,
    furnished: settings.apartmentHasFurnished,
    furnishedType:
    settings.apartmentFurnishedTypes?.map((type) => DataFurnishedType.fromDomain(type).backendValue).toList(),
  );


  ApartmentData({
    this.minFloor,
    this.maxFloor,
    this.minRooms,
    this.maxRooms,
    this.minBathrooms,
    this.minBedrooms,
    this.maxBedrooms,
    this.hasAlternativePower,
    this.hasGarage,
    this.hasElevator,
    this.furnished,
    this.furnishedType,
  });

  factory ApartmentData.fromJson(Map<String, dynamic> json) =>
      _$ApartmentDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApartmentDataToJson(this);
}
