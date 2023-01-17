import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppConnectivity {
  static final AppConnectivity share = AppConnectivity._internal();

  factory AppConnectivity() {
    return share;
  }

  AppConnectivity._internal();
  final InternetConnectionChecker _internetConnectionChecker =
      InternetConnectionChecker();
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
