import '../property.dart';

class Ad {
  final int id;
  final bool isActive;
  final int views;
  final DateTime creationDateUTC;
  final DateTime expirationDateUTC;
  final Property property;
  final bool? isFavorite; // nullable because it's Guest

  Ad({required this.id, required this.isActive, required this.views, required this.creationDateUTC, required this.expirationDateUTC, required this.property, required this.isFavorite});

  bool get isExpired => !isActive;
}
