part of '../property.dart';

class Shop extends Propertable {
  final int floor;
  final ShopType shopType;
  final bool hasWarehouse;
  final bool hasBathroom;
  final bool hasAc;

  Shop({
    required this.floor,
    required this.shopType,
    required this.hasWarehouse,
    required this.hasBathroom,
    required this.hasAc,
  });

  @override
  PropertableEnum toEnum() => PropertableEnum.shop;
}

