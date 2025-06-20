import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/media_file.dart';

part 'media_file.g.dart';

@JsonSerializable()
class MediaFileData {
  final int id;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  MediaFileData({required this.id, required this.imageUrl});

  factory MediaFileData.fromJson(Map<String, dynamic> json) => _$MediaFileDataFromJson(json);
  Map<String, dynamic> toJson() => _$MediaFileDataToJson(this);

  MediaFile toDomain() => MediaFile(id: id, imageUrl: imageUrl);

  static MediaFileData fromDomain(MediaFile file) => MediaFileData(
    id: file.id ?? 0,
    imageUrl: file.imageUrl ?? '',
  );
}