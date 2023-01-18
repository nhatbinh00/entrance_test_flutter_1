import 'package:core/utilities/global/route_name.dart';
import 'package:get/get.dart';

import '../../modules/categories/screens/category_screen.dart';
import '../../main.dart';

class RouteGenerator {

  static final routes = <GetPage<dynamic>>[
    GetPage(name: RouteName.signUp, page: () => const MyHomePage()),
    GetPage(name: RouteName.categoriesPage, page: () => const CategoryScreen()),
  ];
}
