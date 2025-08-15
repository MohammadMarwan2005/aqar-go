// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filter_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchFilterSettings _$SearchFilterSettingsFromJson(
  Map<String, dynamic> json,
) => _SearchFilterSettings(
  minPrice: (json['common,Min Price'] as num?)?.toInt(),
  maxPrice: (json['common,Max Price'] as num?)?.toInt(),
  minArea: (json['common,Min Area'] as num?)?.toInt(),
  maxArea: (json['common,Max Area'] as num?)?.toInt(),
  type: $enumDecodeNullable(
    _$PropertableEnumEnumMap,
    json['common,Property Type'],
  ),
  apartmentMinFloor: (json['apartment,Min Floor'] as num?)?.toInt(),
  apartmentMaxFloor: (json['apartment,Max Floor'] as num?)?.toInt(),
  apartmentMinRooms: (json['apartment,Min Rooms'] as num?)?.toInt(),
  apartmentMaxRooms: (json['apartment,Max Rooms'] as num?)?.toInt(),
  apartmentMinBedrooms: (json['apartment,Min Bedrooms'] as num?)?.toInt(),
  apartmentMinBathrooms: (json['apartment,Min Bathrooms'] as num?)?.toInt(),
  apartmentFurnishedTypes:
      (json['apartment,Furniture Type'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$FurnishedTypeEnumMap, e))
          .toList(),
  apartmentHasAlternativePower:
      json['apartment,Has Alternative Power'] as bool?,
  apartmentHasGarage: json['apartment,Has Garage'] as bool?,
  apartmentHasFurnished: json['apartment,Has Furnished'] as bool?,
  apartmentHasElevator: json['apartment,Has Elevator'] as bool?,
  landTypes:
      (json['land,Land Type'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$LandTypeEnumMap, e))
          .toList(),
  landSlops:
      (json['land,Land Slope'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$LandSlopEnumMap, e))
          .toList(),
  landIsServiced: json['land,Serviced'] as bool?,
  landIsInsideMasterPlan: json['land,Is Inside Master Plan'] as bool?,
  officeMinBathrooms: (json['office,Min Bathrooms'] as num?)?.toInt(),
  officeMinMeetingRooms: (json['office,Min Meeting Rooms'] as num?)?.toInt(),
  officeHasParking: json['office,Has Parking'] as bool?,
  officeIsFurnished: json['office,Is Furnished'] as bool?,
  shopTypes:
      (json['shop,Shop Type'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ShopTypeEnumMap, e))
          .toList(),
  shopHasWarehouse: json['shop,Has Warehouse'] as bool?,
  shopHasBathroom: json['shop,Has Bathroom'] as bool?,
  shopHasAc: json['shop,Has Ac'] as bool?,
);

Map<String, dynamic> _$SearchFilterSettingsToJson(
  _SearchFilterSettings instance,
) => <String, dynamic>{
  'common,Min Price': instance.minPrice,
  'common,Max Price': instance.maxPrice,
  'common,Min Area': instance.minArea,
  'common,Max Area': instance.maxArea,
  'common,Property Type': _$PropertableEnumEnumMap[instance.type],
  'apartment,Min Floor': instance.apartmentMinFloor,
  'apartment,Max Floor': instance.apartmentMaxFloor,
  'apartment,Min Rooms': instance.apartmentMinRooms,
  'apartment,Max Rooms': instance.apartmentMaxRooms,
  'apartment,Min Bedrooms': instance.apartmentMinBedrooms,
  'apartment,Min Bathrooms': instance.apartmentMinBathrooms,
  'apartment,Furniture Type':
      instance.apartmentFurnishedTypes
          ?.map((e) => _$FurnishedTypeEnumMap[e]!)
          .toList(),
  'apartment,Has Alternative Power': instance.apartmentHasAlternativePower,
  'apartment,Has Garage': instance.apartmentHasGarage,
  'apartment,Has Furnished': instance.apartmentHasFurnished,
  'apartment,Has Elevator': instance.apartmentHasElevator,
  'land,Land Type':
      instance.landTypes?.map((e) => _$LandTypeEnumMap[e]!).toList(),
  'land,Land Slope':
      instance.landSlops?.map((e) => _$LandSlopEnumMap[e]!).toList(),
  'land,Serviced': instance.landIsServiced,
  'land,Is Inside Master Plan': instance.landIsInsideMasterPlan,
  'office,Min Bathrooms': instance.officeMinBathrooms,
  'office,Min Meeting Rooms': instance.officeMinMeetingRooms,
  'office,Has Parking': instance.officeHasParking,
  'office,Is Furnished': instance.officeIsFurnished,
  'shop,Shop Type':
      instance.shopTypes?.map((e) => _$ShopTypeEnumMap[e]!).toList(),
  'shop,Has Warehouse': instance.shopHasWarehouse,
  'shop,Has Bathroom': instance.shopHasBathroom,
  'shop,Has Ac': instance.shopHasAc,
};

const _$PropertableEnumEnumMap = {
  PropertableEnum.land: 'land',
  PropertableEnum.shop: 'shop',
  PropertableEnum.office: 'office',
  PropertableEnum.apartment: 'apartment',
};

const _$FurnishedTypeEnumMap = {
  FurnishedType.economic: 'economic',
  FurnishedType.standard: 'standard',
  FurnishedType.deluxe: 'deluxe',
  FurnishedType.superDeluxe: 'superDeluxe',
  FurnishedType.luxury: 'luxury',
};

const _$LandTypeEnumMap = {
  LandType.industrial: 'industrial',
  LandType.agricultural: 'agricultural',
  LandType.commercial: 'commercial',
  LandType.residential: 'residential',
};

const _$LandSlopEnumMap = {
  LandSlop.flat: 'flat',
  LandSlop.sloped: 'sloped',
  LandSlop.mountainous: 'mountainous',
};

const _$ShopTypeEnumMap = {
  ShopType.retail: 'retail',
  ShopType.grocery: 'grocery',
  ShopType.pharmacy: 'pharmacy',
  ShopType.bookstore: 'bookstore',
  ShopType.restaurant: 'restaurant',
  ShopType.salon: 'salon',
  ShopType.other: 'other',
};
