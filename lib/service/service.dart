import 'package:smart_home/models/base_api_response.dart';
import 'package:smart_home/network/network.dart';
import 'package:smart_home/utils/enums/request_types.dart';

class Service {
  Future<BaseAPIResponse> deviceSummaryRequest(String url) async {
    BaseAPIResponse response = await Network.request(url: url, method: RequestType.post, body: {});

    return response;
  }

  Future<BaseAPIResponse> perDeviceAndDateRequest(String url, Map<String, dynamic>? body) async {
    BaseAPIResponse response = await Network.request(url: url, method: RequestType.post, body: body);

    return response;
  }

  Future<BaseAPIResponse> perDateRequest(String url, Map<String, dynamic>? body) async {
    BaseAPIResponse response = await Network.request(url: url, method: RequestType.post, body: body);

    return response;
  }

  Future<BaseAPIResponse> consumptionRequest(String url, Map<String, dynamic>? body) async {
    BaseAPIResponse response = await Network.request(url: url, method: RequestType.post, body: body);

    return response;
  }
}
