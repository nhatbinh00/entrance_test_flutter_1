import 'dart:io';
import 'package:core/common/constants/constant.dart';
import 'package:core/utilities/global/app_login.dart';
import 'package:dio/dio.dart';
import '../../../helper/general/device_helper.dart';
import '../dio_factory.dart';


class RequestInterceptor extends InterceptorsWrapper {

/*
Request requirement
device_os
id_custommer
customer_phone
version_app
signing request
*/

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String accessToken = AppLogin.accessToken;

    if (accessToken.isNotEmpty) {
      await options.headers
          .putIfAbsent("Authorization", () => "Bearer $accessToken");
    }

    final DeviceInfoData deviceInfoData = await DeviceHelper.getDeviceInfo();
    options.headers.addAll({
      "DeviceOS": deviceInfoData.deviceOS,
      "Model": deviceInfoData.model,
      "DeviceId": deviceInfoData.deviceId,
      "OSVersion": deviceInfoData.versionOS,
      "AppVersion": deviceInfoData.appVersion,
      "DeviceCode": Constant.deviceCode,
      "Platform": Platform.operatingSystem
    });
    // options.headers.putIfAbsent("DeviceOS", () => deviceInfoData.deviceOS);
    // options.headers.putIfAbsent("Model", () => deviceInfoData.model);
    // options.headers.putIfAbsent("DeviceId", () => deviceInfoData.deviceId);
    // options.headers.putIfAbsent("OSVersion", () => deviceInfoData.versionOS);
    // options.headers.putIfAbsent("AppVersion", () => deviceInfoData.appVersion);
    // options.headers.putIfAbsent("DeviceCode", () => Constant.deviceCode);

    // options.path += "?culture=$languageCode";

    return handler.next(options);
  }

  bool _isRequestSecured(RequestOptions options) =>
      options.headers.containsKey(RequestHeaders.securedKey);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Connection closed while receiving data: Lỗi khi server build lại làm token cũ bị lỗi
    // err.message.contains("Connection closed while receiving data")
    if (err.response?.statusCode == 401) {
      //_authentication.logOut();
    }
    super.onError(err, handler);
  }
}
