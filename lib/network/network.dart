import 'package:dio/dio.dart';
import 'package:smart_home/models/base_api_response.dart';
import 'package:smart_home/utils/enums/request_types.dart';

class Network {
  static Future<BaseAPIResponse> request(
      {required RequestType method,
      required String url,
      Map<String, dynamic>? body,
      bool isFormData = false,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParams}) async {
    //Var init
    final dio = Dio();
    Response? response;

    if (headers != null) {}

    try {
      switch (method) {
        case RequestType.get:
          response = await dio.get(url, queryParameters: queryParams);
          break;
        case RequestType.post:
          response = response = await dio.post(url, data: isFormData ? FormData.fromMap(body ?? {}) : body);
          break;
        case RequestType.put:
          response = response = await dio.put(url, data: isFormData ? FormData.fromMap(body ?? {}) : body);
          break;
        case RequestType.patch:
          break;
        case RequestType.delete:
          response = response = await dio.delete(url, data: isFormData ? FormData.fromMap(body ?? {}) : body);
          break;
      }

      if (response!.statusCode == 200 && response.data["code"] == 200) {
        return BaseAPIResponse(data: response.data, error: false, status: response.statusCode);
      } else {
        return BaseAPIResponse(data: response.data, error: true, status: response.statusCode);
      }
    } on DioException catch (e) {
      return BaseAPIResponse(data: null, error: true, status: e.response?.statusCode);
    }
  }
}
