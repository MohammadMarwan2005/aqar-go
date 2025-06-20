import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/profile/user_profile.dart';

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

  factory DataUserProfile.fromJson(Map<String, dynamic> json) => _$DataUserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$DataUserProfileToJson(this);

  UserProfile toDomain() => UserProfile(
    userId: id,
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    imageUrl: imageUrl,
  );

  factory DataUserProfile.fromDomain(UserProfile profile) => DataUserProfile(
    id: profile.userId,
    firstName: profile.firstName,
    lastName: profile.lastName,
    phoneNumber: profile.phoneNumber,
    imageUrl: profile.imageUrl,
  );
}
