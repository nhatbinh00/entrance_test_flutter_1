import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../common/constants/colors.dart';

class ProgressHUD {
  static void show() {
    if (!EasyLoading.isShow) {
      EasyLoading.show(status: 'Đang xử lý...', dismissOnTap: false);
    }
  }

  static void dismiss() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    // ..indicatorSize = 45.0
    ..radius = 10.0
    // ..progressColor = Colors.yellow
    ..backgroundColor = AppColors.black4
    ..indicatorColor = AppColors.primary
    ..textColor = AppColors.primary
    // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
