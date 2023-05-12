import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalsha/firebase_options.dart';
import 'package:khalsha/injection_container.dart';

import 'core/data/services/http_service.dart';
import 'core/data/services/notification_service.dart';
import 'core/data/source/local/user_local.dart';
import 'core/presentation/error_view.dart';
import 'core/presentation/routes/app_routes.dart';
import 'core/presentation/themes/theme_manager.dart';
import 'core/presentation/translation/app_translation.dart';

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => ErrorView(details);
  await _initData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Khalsha | خلصها',
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
  String get _initialRoute =>
      UserDataLocal.instance.isLoggedIn ? Routes.root : AppPages.initial;
}

Future<void> _initData() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();

  await UserDataLocal.instance.init();

  Get.lazyPut<HttpService>(() => HttpService(Dio()));
  Get.lazyPut<NotificationsService>(() => NotificationsService());

  await InjectionContainer.init();
}
