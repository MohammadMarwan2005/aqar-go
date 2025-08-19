class APIConstants {
  static const String _domainUrl = "http://116.203.254.150:8001";
  static const String baseUrl = "$_domainUrl/api";
  static const String loginUrl = "$baseUrl/auth/login";
  static const String registerUrl = "$baseUrl/auth/register";
  static const String verifyEmailUrl = "$baseUrl/email/verification-notification";
  static const String sendResetPasswordUrl = "$baseUrl/auth/forgetPassword";
  static const String resetPasswordUrl = "$baseUrl/auth/resetPassword";
  static const String createPropertyUrl = "$baseUrl/property/create";
  static const String updatePropertyUrl = "$baseUrl/property/update";
  static const String getProfileUrl = "$baseUrl/profile/show";
  static const String updateProfileUrl = "$baseUrl/profile/update";
  static const String getUserPropertiesUrl = "$baseUrl/property/getUserProperties";
  static const String createAdUrl = "$baseUrl/ad/create";
  static const String getAdByIdUrl = "$baseUrl/ad/show";
  static const String getUserAdsUrl = "$baseUrl/ad/getUserAds";
  static const String searchAdsUrl = "$baseUrl/ad/search";
  static const String getNearToYouAdsUrl = "$baseUrl/ad/nearToYou";
  static const String getRecommendedAdsUrl = "$baseUrl/ad/recommend";
  static const String activateSelectedAdsUrl = "$baseUrl/ad/activateSelectedAds";
  static const String deactivateAdUrl = "$baseUrl/ad/unactivate";
  static const String deleteAdUrl = "$baseUrl/ad/delete";
  static const String createReportUrl = "$baseUrl/report/create";
  static const String getReviewByIdUrl = "$baseUrl/reviews";
  static const String getAdReviewsUrl = "$baseUrl/property/{id}/reviews";
  static const String createReviewUrl = "$baseUrl/reviews";
}
