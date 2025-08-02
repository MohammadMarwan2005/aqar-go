import '../property.dart';

class Ad {
  final int id;
  final bool isActive;
  final int views;
  final DateTime creationDateUTC;
  final DateTime expirationDateUTC;
  final Property property;

  Ad({required this.id, required this.isActive, required this.views, required this.creationDateUTC, required this.expirationDateUTC, required this.property});

  bool get isExpired => !isActive;
}
