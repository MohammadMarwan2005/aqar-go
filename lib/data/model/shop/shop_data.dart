import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/property.dart';
import '../../../domain/model/shop/shop_type.dart';

part 'shop_data.g.dart';

@JsonSerializable()
class ShopData {
  final int floor;
  final String type;
  @JsonKey(name: 'has_warehouse')
  final bool hasWarehouse;
  @JsonKey(name: 'has_bathroom')
  final bool hasBathroom;
  @JsonKey(name: 'has_ac')
  final bool hasAc;

  ShopData({
    required this.floor,
    required this.type,
    required this.hasWarehouse,
    required this.hasBathroom,
    required this.hasAc,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) =>
      _$ShopDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShopDataToJson(this);

  static ShopData fromDomain(Shop shop) => ShopData(
    floor: shop.floor,
    type: shop.shopType.name,
    hasWarehouse: shop.hasWarehouse,
    hasBathroom: shop.hasBathroom,
    hasAc: shop.hasAc,
  );

  Shop toDomain() => Shop(
    floor: floor,
    shopType: ShopType.values.firstWhere((e) => e.name == type),
    hasWarehouse: hasWarehouse,
    hasBathroom: hasBathroom,
    hasAc: hasAc,
  );
}
