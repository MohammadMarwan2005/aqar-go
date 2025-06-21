part of '../property.dart';

class Apartment extends Propertable {
  final int floor;
  final int rooms;
  final int bathrooms;
  final int bedrooms;
  final bool hasElevator;
  final bool hasAlternativePower;
  final bool hasGarage;
  final bool furnished;
  final String furnishedType;

  Apartment({
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

  @override
  PropertableEnum toEnum() => PropertableEnum.apartment;
}
