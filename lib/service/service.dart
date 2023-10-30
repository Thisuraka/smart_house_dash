import 'package:file_picker/file_picker.dart';
import 'package:smart_home/models/base_api_response.dart';
import 'package:smart_home/network/network.dart';
import 'package:smart_home/utils/enums/request_types.dart';
import 'package:smart_home/utils/urls.dart';

class Service {
  Future<BaseAPIResponse> deviceSummaryRequest() async {
    BaseAPIResponse response = await Network.request(
        url: UrlConstants.getDeviceSummaryEndpoint(), method: RequestType.post, body: {});

    return response;
  }

  Future<BaseAPIResponse> perDeviceAndDateRequest(Map<String, dynamic>? body) async {
    BaseAPIResponse response = await Network.request(
        url: UrlConstants.getPerDeviceAndDateEndpoint(), method: RequestType.post, body: body);

    return response;
  }

  Future<BaseAPIResponse> perDateRequest(Map<String, dynamic>? body) async {
    BaseAPIResponse response =
        await Network.request(url: UrlConstants.getPerDateEndpoint(), method: RequestType.post, body: body);

    return response;
  }

  Future<BaseAPIResponse> consumptionRequest(Map<String, dynamic>? body) async {
    BaseAPIResponse response = await Network.request(
        url: UrlConstants.getConsumptionAnalysisEndpoint(), method: RequestType.post, body: body);

    return response;
  }

  Future<BaseAPIResponse> consumptionPredictionRequest(Map<String, dynamic>? body) async {
    BaseAPIResponse response = await Network.request(
        url: UrlConstants.getMonthlyPredictionEndpoint(), method: RequestType.post, body: body);

    return response;
  }

  Future<BaseAPIResponse> predictAttackRequest(
    FilePickerResult file,
    Function(int, int)? onSendProgress,
  ) async {
    BaseAPIResponse response = await Network.upload(
        picked: file,
        endpoint: UrlConstants.getPredictAttackEndpoint(),
        onSendProgress: onSendProgress);
    return response;
  }
}
