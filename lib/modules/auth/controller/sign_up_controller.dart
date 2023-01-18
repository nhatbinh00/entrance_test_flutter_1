import 'dart:ui';

import 'package:core/utilities/data/network_gen/failure.dart';
import 'package:core/utilities/global/app_loading.dart';
import 'package:core/utilities/global/app_navigator_key.dart';
import 'package:core/utilities/global/route_name.dart';
import 'package:core/widgets/toast/toast_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_entrance_test/modules/auth/dtos/requests/sign_up_request.dart';
import 'package:get/get.dart';
import 'package:core/common/constants/constant.dart';

import '../../../app/dependency_injection/get_it.dart';
import '../dtos/enum/level_pw.dart';
import 'package:core/utilities/utility.dart';

import '../use_case/auth_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SignUpController extends GetxController {
  Rx<LevelPw> levelPw = LevelPw.Unknown.obs;
  Rx<String> email = Constant.empty.obs;
  Rx<String> pw = Constant.empty.obs;

  final AuthUseCase _authUseCase = getIt<AuthUseCase>();

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
      ToastCustom(context).showError('The email is required.');
    } else {
      if (!Utility.isValidEmail(email.value)) {
        ToastCustom(context).showError('The email is not valid.');
      } else {
        if (pw.isEmpty) {
          ToastCustom(context).showError('The password is required.');
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

  Future<void> submitSignUp(BuildContext context) async {
    if (validFormSignUp()) {
      ProgressHUD.show();
      await (await _authUseCase.signUp(
        SignUpRequest(
          firstName: "Trung",
          lastName: "Huynh",
          email: email.value,
          password: pw.value,
        ),
      ))
          .fold((Failure failure) async {
        ProgressHUD.dismiss();
        ToastCustom(context).showError(failure.message);
      }, (data) async {
        ToastCustom(context).showSuccess('Sign Up Success!');
        Get.toNamed(RouteName.categoriesPage);
      }).whenComplete(() => ProgressHUD.dismiss());
    } else {
      checkForm(context);
    }
  }
}
