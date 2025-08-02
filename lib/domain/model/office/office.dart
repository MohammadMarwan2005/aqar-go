part of '../property.dart';

class Office extends Propertable {
  final int floor;
  final int rooms;
  final int bathrooms;
  final int meetingRooms;
  final bool hasParking;
  final bool furnished;

  Office({
    required this.floor,
    required this.rooms,
    required this.bathrooms,
    required this.meetingRooms,
    required this.hasParking,
    required this.furnished,
  });

  @override
  PropertableEnum toEnum() => PropertableEnum.office;
}
