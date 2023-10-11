class UrlConstants {
  static const String environment = "development";
  // static const String environment = "production";
  // static const String baseUrl = "http://10.0.2.2:8080";
  static const String baseUrl = "http://192.168.1.4:8080";

static String getAllEndpoint() {
    if (environment == "development") {
      return "$baseUrl/all";
    } else {
      return "";
    }
  }
}
