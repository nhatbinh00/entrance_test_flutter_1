import 'package:core/utilities/data/network_gen/error_handler.dart';
import 'package:core/utilities/global/app_connectivity.dart';
import 'package:core/utilities/global/app_navigator_key.dart';
import 'package:dio/dio.dart';

class ConnectivityInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!(await AppConnectivity.share.isConnected)) {
      if (AppNavigatorKey.navigator.currentContext != null) {
        // TODO : show dialog
        // DialogHelper.showRequiredInternetDialog();
      }
      return handler.reject(DioError(
          requestOptions: options,
          error: DataSource.noInternetConnection.getFailure()));
    }
    return handler.next(options);
  }
}
