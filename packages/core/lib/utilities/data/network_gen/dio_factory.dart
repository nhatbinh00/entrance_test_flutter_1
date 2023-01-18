
import 'package:core/utilities/data/network_gen/interceptor/connectivity_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'interceptor/request_interceptor.dart';

class RequestHeaders {
  static const String applicationJson = "application/json";
  static const String contentType = "content-type";
  static const String accept = "accept";
  static const String authorization = "Authorization";
  static const String defaultLanguage = "language";
  static const String securedKey = 'secured';
  static const String culture = 'vi_VN';
  static const String brandCode = 'BrandCode';
  static const String posNO = 'PosNO';
}

@module
abstract class DioFactory {
  @lazySingleton
  Dio get dio {
    final dio = Dio();
    int timeOut = 60 * 1000; // 1 min

    Map<String, String> headers = {
      RequestHeaders.contentType: RequestHeaders.applicationJson,
      RequestHeaders.accept: RequestHeaders.applicationJson,
    };
    dio.options = BaseOptions(
        baseUrl: 'http://streaming.nexlesoft.com:4000',
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: headers);
    dio.interceptors.addAll([
      ConnectivityInterceptor(),
      RequestInterceptor(),
    ]);
    if (kReleaseMode) {
      // print("release mode no logs");
    } else {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
    return dio;
  }
}
