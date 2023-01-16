class Preferences {
  Preferences._();

  static const String is_logged_in = "isLoggedIn";
  static const String token = "token";
  static const String os = "os";
  static const String version = "version";
  static const String is_dark_mode = "is_dark_mode";
  static const String dark = "dark";
  static const String light = "light";
  static const String deviceId = "deviceId";
  static const String userInfo = "user_info";
  static const String userId = "user_id";
  static const String login_type = "login_type";
  static const String remember = "remember";
  static const String encryptPw = "encryptPw";
  static const String userName = "username";
  static const String tempEncryptPw = "tempEncryptPw";
  static const String authorize = "authorize";
  static const String isRedirectLogin = "isRedirectLogin";
  static const String core = "core";
  static const String deviceInfor = "deviceInfor";
  static const String phoneNumber = "phoneNumber";
  static const String app = "app";
  static const String web = "web";

  static const String profileName = "profileName";
  static const String profileRankName = "profileRankName";
  static const String profileAvatar = "profileAvatar";
  static const String profileMenuCode = "profileMenuCode";
  static const String defaultMenuCode = "defaultMenuCode";
  static const String language = "language";

  static const String saPopupKey = "saPopupKey";
  static const String saPopUpContentKey = "saPopUpContentKey";

  static const String phone = "phone";
  static const String fullName = "fullName";
  static const String kcfHistorySearchKey = "kcfHistorySearchKey";
  static const String kcfPopupKey = "kcfPopupKey";
  static const String kcfPopUpContentKey = "kcfPopUpContentKey";
  static const String kcfIsShowedInDetailPopupKey =
      "kcfIsShowedInDetailPopupKey";
  static const String nickName = "nickName";
  static const String userAuthBiometrics = "userAuthBiometrics";
  static const String pwAuthBiometrics = "pwAuthBiometrics";
}

class WE40Preferences {
  WE40Preferences._();
  static const _prefix = "WE40";
  static const String isShowedInDetailPopupKey =
      "${_prefix}IsShowedInDetailPopupKey";
  static const String popupKey = "${_prefix}PopupKey";
  static const String popUpContentKey = "${_prefix}PopUpContentKey";
  static const String historySearchKey = "${_prefix}HistorySearchKey";
}

class GT40Preferences {
  GT40Preferences._();
  static const _prefix = "GT40";
  static const String isShowedInDetailPopupKey =
      "${_prefix}IsShowedInDetailPopupKey";
  static const String popupKey = "${_prefix}PopupKey";
  static const String popUpContentKey = "${_prefix}PopUpContentKey";
  static const String historySearchKey = "${_prefix}HistorySearchKey";
}

class KCFPreferences {
  KCFPreferences._();
  static const _prefix = "KCF";
  static const String isShowedInDetailPopupKey =
      "${_prefix}IsShowedInDetailPopupKey";
  static const String popupKey = "${_prefix}PopupKey";
  static const String popUpContentKey = "${_prefix}PopUpContentKey";
  static const String historySearchKey = "${_prefix}HistorySearchKey";
}
