// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaFileData _$MediaFileDataFromJson(Map<String, dynamic> json) =>
    MediaFileData(
      id: (json['id'] as num).toInt(),
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$MediaFileDataToJson(MediaFileData instance) =>
    <String, dynamic>{'id': instance.id, 'image_url': instance.imageUrl};
