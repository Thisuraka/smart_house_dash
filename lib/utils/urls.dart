class UrlConstants {
  static const String environment = "development";
  // static const String environment = "production";
  static const String baseUrl = "http://127.0.0.1:5000";

  static String getDeviceSummaryEndpoint() {
    if (environment == "development") {
      return "$baseUrl/device-analysis";
    } else {
      return "";
    }
  }

  static String getPerDeviceAndDateEndpoint() {
    if (environment == "development") {
      return "$baseUrl/per-device-per-date";
    } else {
      return "";
    }
  }

  static String getPerDateEndpoint() {
    if (environment == "development") {
      return "$baseUrl/daily-analysis";
    } else {
      return "";
    }
  }
}
