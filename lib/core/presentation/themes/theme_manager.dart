import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/presentation/themes/text_manager.dart';

class ThemeManager {
  static ThemeData get theme => ThemeData(
        primaryColor: ColorManager.primaryColor,
        primaryColorLight: const Color(0xFFffffff),
        fontFamily: 'bahji',
        colorScheme: const ColorScheme.light(
          primary: ColorManager.primaryColor,
          secondary: ColorManager.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorManager.primaryColor,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        iconTheme: const IconThemeData(
          size: 30,
          color: ColorManager.primaryColor,
        ),
        textTheme: TextManager.textStyle,
      );
}
