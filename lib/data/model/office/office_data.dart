import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/property.dart';
import '../apartment/data_furnished_type.dart';

part 'office_data.g.dart';

@JsonSerializable()
class OfficeData {
  final int floor;
  final int rooms;
  final int bathrooms;
  @JsonKey(name: 'meeting_rooms')
  final int meetingRooms;
  @JsonKey(name: 'has_parking')
  final bool hasParking;
  final bool furnished;
  // @JsonKey(name: 'furnished_type')
  // final String furnishedType;

  OfficeData({
    required this.floor,
    required this.rooms,
    required this.bathrooms,
    required this.meetingRooms,
    required this.hasParking,
    required this.furnished,
    // required this.furnishedType,
  });

  factory OfficeData.fromJson(Map<String, dynamic> json) =>
      _$OfficeDataFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeDataToJson(this);

  static OfficeData fromDomain(Office office) => OfficeData(
    floor: office.floor,
    rooms: office.rooms,
    bathrooms: office.bathrooms,
    meetingRooms: office.meetingRooms,
    hasParking: office.hasParking,
    furnished: office.furnished,
  );

  Office toDomain() => Office(
    floor: floor,
    rooms: rooms,
    bathrooms: bathrooms,
    meetingRooms: meetingRooms,
    hasParking: hasParking,
    furnished: furnished,
  );
}
