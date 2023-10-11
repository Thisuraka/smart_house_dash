class UrlConstants {
  static const String environment = "development";
  // static const String environment = "production";
  static const String baseUrl = "http://192.168.1.4:8080";

  static String getPerDeviceAndDateEndpoint() {
    if (environment == "development") {
      return "$baseUrl/per-device-per-date";
    } else {
      return "";
    }
  }
}
