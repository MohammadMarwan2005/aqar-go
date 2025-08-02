// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyData _$PropertyDataFromJson(Map<String, dynamic> json) => PropertyData(
  id: (json['id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  addressName: json['address'] as String,
  area: (json['area'] as num).toInt(),
  price: (json['price'] as num).toInt(),
  title: json['name'] as String,
  description: json['description'] as String,
  propertableId: (json['propertyable_id'] as num).toInt(),
  type: json['type'] as String,
  propertable: json['propertyable'] as Map<String, dynamic>,
  images:
      (json['images'] as List<dynamic>)
          .map((e) => MediaFileData.fromJson(e as Map<String, dynamic>))
          .toList(),
  isAd: json['is_ad'] as bool,
);

Map<String, dynamic> _$PropertyDataToJson(PropertyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.addressName,
      'area': instance.area,
      'price': instance.price,
      'name': instance.title,
      'description': instance.description,
      'propertyable_id': instance.propertableId,
      'type': instance.type,
      'propertyable': instance.propertable,
      'is_ad': instance.isAd,
      'images': instance.images,
    };
