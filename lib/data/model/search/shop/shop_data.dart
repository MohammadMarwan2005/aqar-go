part of '../data_search_filter_settings.dart';

@JsonSerializable(includeIfNull: false)
class ShopData implements PropertySearchFilterData {
  @JsonKey(name: 'ShopType')
  final List<String>? shopType;
  @JsonKey(name: 'has_warehouse')
  final bool? hasWarehouse;
  @JsonKey(name: 'has_bathroom')
  final bool? hasBathroom;
  @JsonKey(name: 'has_ac')
  final bool? hasAc;

  ShopData({
    this.shopType,
    this.hasWarehouse,
    this.hasBathroom,
    this.hasAc,
  });

  factory ShopData.fromDomain(
      SearchFilterSettings settings,
      ) => ShopData(
    shopType: settings.shopTypes?.map((type) => type.name).toList(),
    hasWarehouse: settings.shopHasWarehouse,
    hasBathroom: settings.shopHasBathroom,
    hasAc: settings.shopHasAc,
  );


  factory ShopData.fromJson(Map<String, dynamic> json) =>
      _$ShopDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ShopDataToJson(this);
}
