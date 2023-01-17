import 'package:core/common/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'auth/screens/sign_up_screen.dart';
import 'auth/screens/widgets/spacer_widget.dart';
import 'package:get/get.dart';
import 'package:core/utilities/global/app_navigator_key.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [GetObserver()],
      home: const MyHomePage(),
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
