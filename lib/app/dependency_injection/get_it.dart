import 'package:core/dependency_injection/get_it.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';


import 'get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> initDependencyInjection() async {
  await $initGetIt(getIt);
  await Future.wait([
   initCoreDependencyInjection()
  ]);
}

@module
abstract class UtilInjectableModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
