class UrlConstants {
  static const String environment = "development";
  // static const String environment = "production";
  static const String baseUrl = "http://127.0.0.1:5000";

  static String getPerDeviceAndDateEndpoint() {
    if (environment == "development") {
      return "$baseUrl/per-device-per-date";
    } else {
      return "";
    }
  }
}
