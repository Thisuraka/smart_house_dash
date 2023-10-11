import 'package:smart_home/models/base_api_response.dart';
import 'package:smart_home/network/network.dart';
import 'package:smart_home/utils/enums/request_types.dart';

class Service {
  Future<BaseAPIResponse> perDeviceAndDateRequest(Function(int, int)? onSendProgress, String url) async {
    BaseAPIResponse response = await Network.request(url: url, method: RequestType.post, body: {});
    return response;
  }
}
