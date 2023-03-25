import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/routes/app_routes.dart';
import 'core/themes/theme_manager.dart';
import 'core/translation/app_translation.dart';

bool provider = false;

void main() {
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
  String get _initialRoute => AppPages.initial;
}
