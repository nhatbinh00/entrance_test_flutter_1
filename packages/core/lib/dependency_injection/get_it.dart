import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initCoreGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> initCoreDependencyInjection() async => $initCoreGetIt(getIt);
