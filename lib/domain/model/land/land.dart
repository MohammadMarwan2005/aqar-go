part of '../property.dart';

class Land extends Propertable {
  final LandType landType;
  final LandSlop landSlop;
  final bool isServiced;
  final bool isInsideMasterPlan;

  Land({required this.isServiced, required this.landType, required this.isInsideMasterPlan, required this.landSlop});

  @override
  PropertableEnum toEnum() => PropertableEnum.land;
}


