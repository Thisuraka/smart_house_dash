import 'package:smart_home/models/base_api_response.dart';
import 'package:smart_home/network/network.dart';
import 'package:smart_home/utils/enums/request_types.dart';

class Service {
  Future<BaseAPIResponse> perDeviceAndDateRequest(String url, Map<String, dynamic>? body) async {
    BaseAPIResponse response = await Network.request(url: url, method: RequestType.post, body: body);

    return response;
  }
}
