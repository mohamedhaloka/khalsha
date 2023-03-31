import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import 'core/data/local_storage/user_local.dart';
import 'core/data/services/http_service.dart';
import 'core/presentation/routes/app_routes.dart';
import 'core/presentation/themes/theme_manager.dart';
import 'core/presentation/translation/app_translation.dart';

bool provider = false;

void main() async {
  await _initData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Khalsha',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.theme,
      getPages: AppPages.routes,
      translations: AppTranslation(),
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: InkWell(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: child,
          ),
        );
      },
      initialRoute: _initialRoute,
      locale: _locale,
      fallbackLocale: const Locale('ar'),
    );
  }

  Locale get _locale => const Locale('ar');
  String get _initialRoute => UserDataLocal.instance.isLoggedIn
      ? Routes.navigationMenu
      : AppPages.initial;
}

Future<void> _initData() async {
  await UserDataLocal.instance.init();

  Get.lazyPut<HttpService>(() => HttpService(Dio()));

  await InjectionContainer.init();
}
