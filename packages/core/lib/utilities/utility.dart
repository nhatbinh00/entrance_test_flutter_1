import 'dart:math';
import 'dart:ui';
import 'dart:convert';
import 'package:crypto/crypto.dart';
class Utility {
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  static bool isValidPhoneNumber(phone) =>
      RegExp(r'^0[0-9]{9}$').hasMatch(phone);

  ///check password validate
  static bool isPasswordCompliant(String password, [int minLength = 6]) {
    if (password.isEmpty) {
      return false;
    }

    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasDigits = password.contains(RegExp(r'[0-9]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    final hasMinLength = password.length >= minLength;

    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }

  static bool isPasswordCompliantVer2(String password, [int minLength = 6]) {
    if (password.isEmpty) {
      return false;
    }
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasDigits = password.contains(RegExp(r'[0-9]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasMinLength = password.length >= minLength;

    return hasMinLength & hasDigits & (hasUppercase || hasLowercase);
  }

  ///check password by length
  static bool isPasswordCompliantByLength(String password,
      [int minLength = 8]) {
    final hasMinLength = password.length >= minLength || password.isEmpty;
    return hasMinLength;
  }

  static String generateRandomString(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  static String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
      return value;
    }
    return price;
  }

  static String emptyStringToDefaultValue(String? value, String defaultValue) {
    if (value?.isNotEmpty ?? false) {
      return value!;
    }
    return defaultValue;
  }



   static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
