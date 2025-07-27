sealed class Routes {
  static const onboarding = "/";
  static const test = "/test";
  static const login = "/login";
  static const register = "/register";
  static const verifyPhone = "/phone-verify";
  static const createUpdatePost = "/create-post";
  static const myProperties = "/my-properties";

  static const home = "/home-user";
  static const search = "/search-user";
  static const profile = "/profile";

  static bool isAllowed(String route) {
    return true;
  }
}
