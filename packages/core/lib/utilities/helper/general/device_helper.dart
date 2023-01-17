import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:core/common/constants/constant.dart';

class DeviceHelper {
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  static DeviceInfoData? _data;
  static Future<DeviceInfoData> getDeviceInfo() async {
    if (_data != null) {
      return _data!;
    }
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (Platform.isAndroid) {
      var deviceData = await _deviceInfoPlugin.androidInfo;
      _data = DeviceInfoData(
          deviceId: deviceData.androidId ?? Constant.empty,
          deviceOS: Platform.operatingSystem,
          versionOS: deviceData.version.release ?? Constant.empty,
          model: deviceData.model ?? Constant.empty,
          appVersion: "${packageInfo.version}.${packageInfo.buildNumber}",
          appVersionDisplay: "${packageInfo.version}.${packageInfo.buildNumber}");
    } else if (Platform.isIOS) {
      var deviceData = await _deviceInfoPlugin.iosInfo;
      _data = DeviceInfoData(
        deviceId: deviceData.identifierForVendor ?? Constant.empty,
        model: deviceData.model ?? Constant.empty,
        deviceOS: Platform.operatingSystem,
        versionOS: deviceData.systemVersion ?? Constant.empty,
        appVersion: "${packageInfo.version}.${packageInfo.buildNumber}",
        appVersionDisplay:
            "${packageInfo.version}.${packageInfo.buildNumber}",
      );
    } else {
      _data = DeviceInfoData(
        deviceId: Constant.empty,
        model: Constant.empty,
        deviceOS: "",
        versionOS: "",
        appVersion: "",
      );
    }

    return _data!;
  }

  static DeviceInfoData? dataInformation() => _data;
}

class DeviceInfoData {
  String? deviceId;
  String? deviceOS;
  String? versionOS;
  String? model;
  String? appVersion;
  String? appVersionDisplay;
  DeviceInfoData({
    this.deviceId,
    this.deviceOS,
    this.versionOS,
    this.model,
    this.appVersion,
    this.appVersionDisplay,
  });

  factory DeviceInfoData.fromJson(Map<String, dynamic> json) => DeviceInfoData(
        deviceId: json["deviceId"],
        deviceOS: json["deviceOS"],
        versionOS: json["versionOS"],
        model: json["model"],
        appVersion: json["appVersion"],
        appVersionDisplay: json["appVersionDisplay"],
      );

  Map<String, dynamic> toJson() => {
        "deviceId": deviceId,
        "deviceOS": deviceOS,
        "versionOS": versionOS,
        "model": model,
        "appVersion": appVersion,
        "appVersionDisplay": appVersionDisplay,
      };
}
