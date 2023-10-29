class ApiMethods {
  static const String domain = "https://api-test.checkmate.zone";
  static const String version = "v1";
  static const String baseUrl = "$domain/$version/";

  ///[Auth Apis]
  static const String sendOTP = "${baseUrl}auth/sms-otp";
  static const String verifyOTP = "${baseUrl}auth/otp-verify";
  static const String getUserProfile =
      "${baseUrl}profiles"; // also used for updating user profile
  static const String uploadPIC = "${baseUrl}profiles/upload";

  static String getZones(String lat, String lng) =>
      "${baseUrl}zones/by-coordinates?lat=$lat&lng=$lng";

}
