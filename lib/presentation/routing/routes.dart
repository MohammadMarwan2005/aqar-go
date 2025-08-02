sealed class Routes {
  static const onboarding = "/";
  static const test = "/test";
  static const login = "/login";
  static const register = "/register";
  static const verifyPhone = "/phone-verify";
  static const createUpdatePost = "/create-post";
  static const myProperties = "/my-properties";
  static const myPublishedAds = "/published-ads";
  static const myAdDetails = "/my-ad-details/:id";

  static const home = "/home-user";
  static const search = "/search-user";
  static const profile = "/profile";

  static bool isAllowed(String route) {
    return true;
  }

  static String getMyAdDetails(int id) => _getRouteWithId(myAdDetails, id.toString());

  static String _getRouteWithId(String route, String id, {String idKey = ":id"}) {
    return route.replaceAll(idKey, id);
  }
}
