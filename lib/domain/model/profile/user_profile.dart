class UserProfile {
  final int userId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? imageUrl;
  final bool isVerified;
  final bool isPremium;

  UserProfile({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.imageUrl,
    required this.isVerified,
    required this.isPremium,
  });
}
