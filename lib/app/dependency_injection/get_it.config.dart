// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../modules/auth/controller/sign_up_controller.dart' as _i6;
import '../../modules/auth/repositories/auth_repository.dart' as _i7;
import '../../modules/auth/services/rest_service.dart' as _i3;
import '../../modules/auth/use_case/auth_usecase.dart' as _i8;
import 'get_it.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final utilInjectableModule = _$UtilInjectableModule();
  gh.lazySingleton<_i3.AuthService>(() => _i3.AuthService(get<_i4.Dio>()));
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => utilInjectableModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i6.SignUpController>(() => _i6.SignUpController());
  gh.lazySingleton<_i7.AuthRepository>(
      () => _i7.AuthRepositoryImpl(get<_i3.AuthService>()));
  gh.lazySingleton<_i8.AuthUseCase>(
      () => _i8.AuthUseCase(get<_i7.AuthRepository>()));
  return get;
}

class _$UtilInjectableModule extends _i9.UtilInjectableModule {}
