// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../modules/auth/controller/sign_up_controller.dart' as _i8;
import '../../modules/auth/repositories/auth_repository.dart' as _i9;
import '../../modules/auth/services/rest_service.dart' as _i3;
import '../../modules/auth/use_case/auth_usecase.dart' as _i10;
import '../../modules/categories/controller/category_controller.dart' as _i5;
import '../../modules/categories/repositories/category_repository.dart' as _i11;
import '../../modules/categories/services/rest_service.dart' as _i6;
import '../../modules/categories/use_case/category_usecase.dart' as _i12;
import 'get_it.dart' as _i13; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i5.CategoryController>(() => _i5.CategoryController());
  gh.lazySingleton<_i6.CategoryService>(
      () => _i6.CategoryService(get<_i4.Dio>()));
  await gh.factoryAsync<_i7.SharedPreferences>(
    () => utilInjectableModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i8.SignUpController>(() => _i8.SignUpController());
  gh.lazySingleton<_i9.AuthRepository>(
      () => _i9.AuthRepositoryImpl(get<_i3.AuthService>()));
  gh.lazySingleton<_i10.AuthUseCase>(
      () => _i10.AuthUseCase(get<_i9.AuthRepository>()));
  gh.lazySingleton<_i11.CategoryRepository>(
      () => _i11.CategoryRepositoryImpl(get<_i6.CategoryService>()));
  gh.lazySingleton<_i12.CategoryUseCase>(
      () => _i12.CategoryUseCase(get<_i11.CategoryRepository>()));
  return get;
}

class _$UtilInjectableModule extends _i13.UtilInjectableModule {}
