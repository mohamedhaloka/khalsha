import 'dart:async';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:khalsha/features/login/domain/use_cases/login_use_case.dart';
import 'package:khalsha/features/register/data/repository_impl/register_repository_impl.dart';
import 'package:khalsha/features/register/data/source/register_remote_data_source.dart';
import 'package:khalsha/features/register/domain/use_cases/register_use_case.dart';

import 'core/data/services/http_service.dart';
import 'features/login/data/repository_impl/login_repository_impl.dart';
import 'features/login/data/source/login_remote_data_source.dart';
import 'features/login/domain/repository/login_repository.dart';
import 'features/register/domain/repository/register_repository.dart';

class InjectionContainer {
  static GetIt sl = GetIt.I;

  static Future<void> init() async {
    final dioService = Get.find<HttpService>();

    //Login
    sl.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));

    //Register
    sl.registerLazySingleton<RegisterRemoteDataSource>(
        () => RegisterRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  }
}
