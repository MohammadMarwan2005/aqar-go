import 'package:aqar_go/data/model/apartment/apartment_data.dart';
import 'package:aqar_go/data/model/office/office_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/property.dart';
import '../land/land_data.dart';
import '../media_file.dart';
import '../shop/shop_data.dart';

part 'property_data.g.dart';

@JsonSerializable()
class PropertyData {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'location_id')
  final int locationId;
  final int area;
  final int price;
  @JsonKey(name: 'name')
  final String title;
  final String description;
  @JsonKey(name: 'propertyable_id')
  final int propertableId;
  final String type;
  @JsonKey(name: "propertyable")
  final Map<String, dynamic> propertable;

  @JsonKey(name: 'is_ad')
  final bool isAd;

  final List<MediaFileData> images;

  PropertyData({
    required this.id,
    required this.userId,
    required this.locationId,
    required this.area,
    required this.price,
    required this.title,
    required this.description,
    required this.propertableId,
    required this.type,
    required this.propertable,
    required this.images,
    required this.isAd,
  });

  factory PropertyData.fromJson(Map<String, dynamic> json) =>
      _$PropertyDataFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyDataToJson(this);

  Property toDomain() => Property(
    id: id,
    userId: userId,
    locationId: locationId,
    area: area,
    price: price,
    title: title,
    description: description,
    isAd: isAd,
    propertableId: propertableId,
    propertable: _mapPropertable(type, propertable),
    images: images.map((e) => e.toDomain()).toList(),
  );

  static PropertyData fromDomain(Property p) {
    late Map<String, dynamic> propertableJson;
    switch (p.propertable) {
      case Land():
        propertableJson = LandData.fromDomain(p.propertable as Land).toJson();
      case Office():
        propertableJson =
            OfficeData.fromDomain(p.propertable as Office).toJson();
      case Apartment():
        propertableJson =
            ApartmentData.fromDomain(p.propertable as Apartment).toJson();
      case Shop():
        propertableJson = ShopData.fromDomain(p.propertable as Shop).toJson();
    }

    return PropertyData(
      id: p.id,
      userId: p.userId,
      locationId: p.locationId,
      area: p.area,
      price: p.price,
      title: p.title,
      description: p.description,
      propertableId: p.propertableId,
      type: p.propertable.toEnum().labelId,
      propertable: propertableJson,
      images:
          p.images
              .where((i) => i.id != null && i.imageUrl != null)
              .map(MediaFileData.fromDomain)
              .toList(),
      isAd: p.isAd,
    );
  }

  dynamic _mapPropertable(String type, dynamic data) {
    final en = PropertableEnum.values.firstWhere(
      (element) => element.labelId.toLowerCase() == type.toLowerCase(),
    );
    switch (en) {
      case PropertableEnum.land:
        return LandData.fromJson(propertable).toDomain();
      case PropertableEnum.shop:
        return ShopData.fromJson(propertable).toDomain();
      case PropertableEnum.office:
        return OfficeData.fromJson(propertable).toDomain();
      case PropertableEnum.apartment:
        return ApartmentData.fromJson(propertable).toDomain();
    }
  }
}
