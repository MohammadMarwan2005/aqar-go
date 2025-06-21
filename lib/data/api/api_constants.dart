class APIConstants {
  static const String _domainUrl = "http://116.203.254.150:8001";
  static const String baseUrl = "$_domainUrl/api";
  static const String loginUrl = "$baseUrl/auth/login";
  static const String registerUrl = "$baseUrl/auth/register";
  static const String createPropertyUrl = "$baseUrl/property/create";
  static const String updatePropertyUrl = "$baseUrl/property/update";
  static const String getProfileUrl = "$baseUrl/profile/show";
  static const String getUserPropertiesUrl = "$baseUrl/property/getUserProperties";
}
