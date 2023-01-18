//Dependency Injection

import 'package:core/utilities/global/app_loading.dart';
import 'package:core/utilities/global/app_login.dart';
import 'package:core/utilities/global/app_shared.dart';
import 'get_it.dart';

class DependencyInjection {
  static Future<void> init() async {
    await initDependencyInjection();
    // init app shared
    await AppShared.init();
    // init Login state
    await AppLogin.init();
    // init Loading
    configLoading();

    //orientation
    // WidgetsBinding.instance!
    //     .addPostFrameCallback((_) => setPreferredOrientations());
  }
}
