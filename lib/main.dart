import 'package:core/common/constants/dimens.dart';
import 'package:core/utilities/global/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/dependency_injection/di.dart';
import 'app/dependency_injection/routes_manager.dart';

import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'modules/auth/screens/sign_up_screen.dart';
import 'modules/auth/screens/widgets/spacer_widget.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteName.signUp,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [GetObserver()],
      builder: EasyLoading.init(),
      getPages: RouteGenerator.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => ScreenUtilInit(
        designSize: const Size(
          Dimens.width_design,
          Dimens.height_design,
        ),
        builder: (context, _) => GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              spacer.sink.add(false);
            },
            child: const SignUpScreen()),
      ),
    );
  }
}
