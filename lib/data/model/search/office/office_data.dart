part of '../data_search_filter_settings.dart';
@JsonSerializable(includeIfNull: false)
class OfficeData implements PropertySearchFilterData {
  final int? floor;
  final int? rooms;
  final int? minBathrooms;
  @JsonKey(name: 'meeting_rooms')
  final int? minMeetingRooms;
  @JsonKey(name: 'has_parking')
  final bool? hasParking;
  final bool? furnished;

  OfficeData({
    this.floor,
    this.rooms,
    this.minBathrooms,
    this.minMeetingRooms,
    this.hasParking,
    this.furnished,
  });

  factory OfficeData.fromDomain(
      SearchFilterSettings settings,
      ) => OfficeData(
    minBathrooms: settings.officeMinBathrooms,
    minMeetingRooms: settings.officeMinMeetingRooms,
    hasParking: settings.officeHasParking,
    furnished: settings.officeIsFurnished,
  );

  @override
  factory OfficeData.fromJson(Map<String, dynamic> json) =>
      _$OfficeDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OfficeDataToJson(this);
}
