import 'dart:async';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:khalsha/features/forget_password/data/repo_impl/forget_password_repository_impl.dart';
import 'package:khalsha/features/forget_password/data/source/forget_password_remote_data_source.dart';
import 'package:khalsha/features/forget_password/domain/repository/forget_password_repository.dart';
import 'package:khalsha/features/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:khalsha/features/login/domain/use_cases/login_use_case.dart';
import 'package:khalsha/features/otp/data/repository_impl/otp_repository_impl.dart';
import 'package:khalsha/features/otp/data/source/otp_remote_data_source.dart';
import 'package:khalsha/features/otp/domain/repository/otp_repository.dart';
import 'package:khalsha/features/otp/domain/use_cases/check_code_use_case.dart';
import 'package:khalsha/features/otp/domain/use_cases/send_code.dart';
import 'package:khalsha/features/register/data/repository_impl/register_repository_impl.dart';
import 'package:khalsha/features/register/data/source/register_remote_data_source.dart';
import 'package:khalsha/features/register/domain/use_cases/register_use_case.dart';
import 'package:khalsha/features/reset_password/data/repo_impl/reset_password_repository_impl.dart';
import 'package:khalsha/features/reset_password/data/source/reset_password_remote_data_source.dart';
import 'package:khalsha/features/reset_password/domain/repository/reset_password_repository.dart';
import 'package:khalsha/features/reset_password/domain/use_cases/reset_password_use_case.dart';

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

    //OTP
    sl.registerLazySingleton<OTPRemoteDataSource>(
        () => OTPRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<OTPRepository>(() => OTPRepositoryImpl(sl()));
    sl.registerLazySingleton<SendCodeUseCase>(() => SendCodeUseCase(sl()));
    sl.registerLazySingleton<CheckCodeUseCase>(() => CheckCodeUseCase(sl()));

    //Forget Password
    sl.registerLazySingleton<ForgetPasswordRemoteDataSource>(
        () => ForgetPasswordRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<ForgetPasswordRepository>(
        () => ForgetPasswordRepositoryImpl(sl()));
    sl.registerLazySingleton<ForgetPasswordUseCase>(
        () => ForgetPasswordUseCase(sl()));

    //Reset Password
    sl.registerLazySingleton<ResetPasswordRemoteDataSource>(
        () => ResetPasswordRemoteDataSourceImpl(dioService));
    sl.registerLazySingleton<ResetPasswordRepository>(
        () => ResetPasswordRepositoryImpl(sl()));
    sl.registerLazySingleton<ResetPasswordUseCase>(
        () => ResetPasswordUseCase(sl()));
  }
}
