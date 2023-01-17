import 'dart:ui';

import 'package:core/utilities/global/app_navigator_key.dart';
import 'package:core/widgets/toast/toast_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:core/common/constants/constant.dart';
import '../dtos/enum/level_pw.dart';
import 'package:core/utilities/utility.dart';

class SignUpController extends GetxController {
  Rx<LevelPw> levelPw = LevelPw.Unknown.obs;
  Rx<String> email = Constant.empty.obs;
  Rx<String> pw = Constant.empty.obs;

  void validatePw(String password) {
    // set Pw
    setPw(password);
    //-------------------------
    if (password.length >= 6 && password.length <= 18) {
      final hasUppercase = password.contains(RegExp(r'[A-Z]'));
      final hasDigits = password.contains(RegExp(r'[0-9]'));
      final hasLowercase = password.contains(RegExp(r'[a-z]'));
      final hasSpecialCharacters =
          password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      if (!hasUppercase || !hasLowercase) {
        levelPw.value = LevelPw.Weak;
        return;
      }
      if (hasUppercase && hasLowercase && !hasDigits) {
        levelPw.value = LevelPw.Fair;
        return;
      }
      if (hasUppercase && hasLowercase && hasDigits && !hasSpecialCharacters) {
        levelPw.value = LevelPw.Good;
        return;
      }
      if (hasUppercase && hasLowercase && hasDigits && hasSpecialCharacters) {
        levelPw.value = LevelPw.Strong;
        return;
      }
    } else {
      if (password.length < 6) {
        if (password.isEmpty) {
          levelPw.value = LevelPw.Unknown;
          return;
        }
        levelPw.value = LevelPw.Short;
        return;
      }
      if (password.length > 18) {
        levelPw.value = LevelPw.Long;
        return;
      }
    }
  }

  void setEmail(String emailText) {
    email.value = emailText;
  }

  void setPw(String pwText) {
    pw.value = pwText;
  }

  bool validFormSignUp() {
    if (Utility.isValidEmail(email.value) &&
        (levelPw.value == LevelPw.Good || levelPw.value == LevelPw.Strong)) {
      return true;
    }
    return false;
  }

  void checkForm(BuildContext context) {
    if (email.value.isEmpty) {
      ToastCustom(context)
          .showError('The email is required.');
    } else {
      if (!Utility.isValidEmail(email.value)) {
        ToastCustom(context)
            .showError('The email is not valid.');
      } else {
        if (pw.isEmpty) {
          ToastCustom(context)
              .showError('The password is required.');
        } else {
          if (levelPw.value != LevelPw.Good &&
              levelPw.value != LevelPw.Strong) {
            ToastCustom(context)
                .showError('The password must be Good or Strong.');
          }
        }
      }
    }
  }

  void submitSignUp(BuildContext context) {
    if (validFormSignUp()) {
      // sign Up
    } else {
      checkForm(context);
    }
  }
}
