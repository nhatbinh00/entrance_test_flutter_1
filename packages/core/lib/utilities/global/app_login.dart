import 'package:core/common/constants/constant.dart';

import '../../common/constants/preferences.dart';
import 'app_shared.dart';

enum AppLoginType { noToken, hasToken, logout }

class AppLogin {
  static AppLoginType type = AppLoginType.noToken;
  static String accessToken = "";
  static String phone = "";

  static Future init() async {
    type = AppLoginType.noToken;
    String? token = AppShared.share?.getString(Preferences.token);
    var userInfo = AppShared.share?.getString(Preferences.userInfo);
    if (token != null) {
      await savLogin(token, "");
    }
  }

  static void setLogout() async {
    try {
      if (isLoggedIn) {
        accessToken = "";
        type = AppLoginType.logout;
      }
    } catch (e) {
      //
    }
  }

  static void setLogin(String accessToken,
      {bool keepLogin = false, String phone = '', String name = ''}) async {
    if (keepLogin) {
      AppShared.share?.setString(Preferences.token, accessToken);
      AppShared.share?.setString(Preferences.phoneNumber, phone);
    } else {
      AppShared.share?.remove(Preferences.phoneNumber);
    }
    savLogin(accessToken, phone);
  }

  static Future savLogin(String token, String phoneNumber) async {
    phone = phoneNumber;
    accessToken = token;
    type = AppLoginType.hasToken;
  }

  static void saveToken(String token) {
    accessToken = token;
  }

  static bool get isLoggedIn => type == AppLoginType.hasToken;

  static AppLoginType getState() => type;
}
