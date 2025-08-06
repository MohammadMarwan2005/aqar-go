sealed class Routes {
  static const onboarding = "/";
  static const test = "/test";
  static const login = "/login";
  static const register = "/register";
  static const forgotPassword = "/forget-password";
  static const checkPasswordOTP = "/check-password-otp";
  static const createUpdatePost = "/create-post";
  static const myProperties = "/my-properties";
  static const myPublishedAds = "/published-ads";
  static const myAdDetails = "/my-ad-details/:id";
  static const viewAd = "/view-ad/:id";
  static const theme = "/theme";
  static const language = "/language";
  static const verifyEmail = "/verify-email";
  static const updateProfile = "/update-profile";
  static const privacyPolicy = "/privacy-policy";

  static const home = "/home-user";
  static const search = "/search-user";
  static const profile = "/profile";

  static const _allowedRoutesForGuest = [onboarding, home, search, viewAd, login, register, forgotPassword, checkPasswordOTP];

  static bool isAllowed(String route) {
    return _allowedRoutesForGuest.any((allowedRoute) {
      if (allowedRoute.contains('/:')) {
        final baseAllowed = allowedRoute.split('/:').first;
        return route.startsWith(baseAllowed);
      }
      return route == allowedRoute;
    });
  }

  static String getMyAdDetails(int id) => _getRouteWithId(myAdDetails, id.toString());

  static String _getRouteWithId(String route, String id, {String idKey = ":id"}) {
    return route.replaceAll(idKey, id);
  }
}
