import 'package:json_annotation/json_annotation.dart';

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
    required this.imageUrl
  });

  factory DataUserProfile.fromJson(Map<String, dynamic> json) => _$DataUserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$DataUserProfileToJson(this);
}
