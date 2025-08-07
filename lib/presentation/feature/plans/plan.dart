import 'package:flutter/cupertino.dart';

class Plan {
  String nameId;
  bool isPremium;
  double priceInDollar;
  List<PlanFeature> features;

  Plan({
    required this.nameId,
    required this.isPremium,
    required this.priceInDollar,
    required this.features,
  });
}

class PlanFeature {
  String nameId;
  bool isAvailable;
  IconData iconData;

  PlanFeature({
    required this.nameId,
    required this.isAvailable,
    required this.iconData,
  });
}
