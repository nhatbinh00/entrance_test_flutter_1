import 'package:flutter/material.dart';


class AppNavigatorKey {
  static final GlobalKey<NavigatorState> navigator =
      GlobalKey<NavigatorState>();

  static final scaffoldKey = GlobalKey<ScaffoldState>();

  // static void openDrawer() => scaffoldKey.currentState!.openDrawer();

  //static void closeDrawer() => scaffoldKey.currentState!.openEndDrawer();
}
