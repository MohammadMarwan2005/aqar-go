class UserProfile {
  final int userId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? imageUrl;
  final bool isVerified;
  final bool isPremium;
  final double? longitude;
  final double? latitude;

  UserProfile({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.imageUrl,
    required this.isVerified,
    required this.isPremium,
    this.longitude,
    this.latitude,
  });
}
