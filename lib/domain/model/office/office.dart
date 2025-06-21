part of '../property.dart';

class Office extends Propertable {
  final int floor;
  final int rooms;
  final int bathrooms;
  final int? meetingRooms;
  final bool hasParking;
  final bool furnished;
  final String furnishedType;

  Office({
    required this.floor,
    required this.rooms,
    required this.bathrooms,
    this.meetingRooms,
    required this.hasParking,
    required this.furnished,
    required this.furnishedType,
  });

  @override
  PropertableEnum toEnum() => PropertableEnum.office;
}
