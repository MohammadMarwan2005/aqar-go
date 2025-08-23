import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/model/profile/user_profile.dart';
import '../data_user_profile.dart';

part 'data_user.g.dart';

@JsonSerializable()
class DataUser {
  final int id;
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @JsonKey(name: 'has_active_subscription')
  final int? isPremium;
  final DataUserProfile profile;

  DataUser({
    required this.id,
    required this.emailVerifiedAt,
    required this.profile,
    this.isPremium = 0,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) =>
      _$DataUserFromJson(json);

  Map<String, dynamic> toJson() => _$DataUserToJson(this);

  UserProfile toDomain() => UserProfile(
    userId: id,
    firstName: profile.firstName,
    lastName: profile.lastName,
    phoneNumber: profile.phoneNumber,
    imageUrl: profile.imageUrl,
    isVerified: emailVerifiedAt != null,
    isPremium: isPremium == 1,
  );

  factory DataUser.fromDomain(UserProfile domainProfile) {
    final dataProfile = DataUserProfile(
      id: domainProfile.userId,
      firstName: domainProfile.firstName,
      lastName: domainProfile.lastName,
      phoneNumber: domainProfile.phoneNumber,
      imageUrl: domainProfile.imageUrl,
    );
    return DataUser(
      id: dataProfile.id,
      emailVerifiedAt: null,
      profile: dataProfile,
    );
  }
}
