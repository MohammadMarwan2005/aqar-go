import 'package:aqar_go/data/model/plan/plan_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_symbols_icons/symbols.dart';

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

  factory Plan.fromDomainEnum(PlanEnum plan) {
    return switch (plan) {
      PlanEnum.free => Plan.free,
      PlanEnum.premium => Plan.premium,
    };
  }

  static final free = Plan(
    nameId: "Free",
    isPremium: false,
    priceInDollar: 0,
    features: [
      PlanFeature(
        nameId: "3 ads maximum",
        isAvailable: true,
        iconData: Symbols.ad_off,
      ),
      PlanFeature(
        nameId: "Standard ad reach",
        isAvailable: true,
        iconData: Symbols.search,
      ),
      PlanFeature(
        nameId: "Basic support",
        isAvailable: true,
        iconData: Symbols.support,
      ),
    ],
  );

  static final premium = Plan(
    nameId: "Premium",
    isPremium: true,
    priceInDollar: 4.99,
    features: [
      PlanFeature(
        nameId: "Up to 15 ads",
        isAvailable: true,
        iconData: Symbols.all_inclusive,
      ),
      PlanFeature(
        nameId: "Priority ad reach",
        isAvailable: true,
        iconData: Symbols.query_stats,
      ),
      PlanFeature(
        nameId: "24/7 Premium support",
        isAvailable: true,
        iconData: Symbols.support_agent,
      ),
      PlanFeature(
        nameId: "More...",
        isAvailable: true,
        iconData: Symbols.diamond,
      ),
    ],
  );
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
