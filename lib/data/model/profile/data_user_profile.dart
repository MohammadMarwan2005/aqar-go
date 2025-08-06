import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/media_file.dart';

part 'data_user_profile.g.dart';

@JsonSerializable()
class DataUserProfile {
  final int id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  DataUserProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.imageUrl,
  });

  factory DataUserProfile.fromJson(Map<String, dynamic> json) =>
      _$DataUserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$DataUserProfileToJson(this);

  FormData toFormData({MediaFile? toUploadImage}) {
    final jsonData = toJson()..remove('image_url');
    final formData = FormData.fromMap(jsonData);
    if (toUploadImage != null) {
      formData.files.add(MapEntry(
        'image_url',
        MultipartFile.fromFileSync(toUploadImage.path.toString()),
      ));
    }
    return formData;
  }
}
