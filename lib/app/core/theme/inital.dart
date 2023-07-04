import 'package:flutter/material.dart';
import 'colors.dart';


class AppThemeInitial {
  static appTheme() => ThemeData(
        primaryColor: AppColors.primaryColor,
        fontFamily: "Readex Pro",
        platform: TargetPlatform.iOS,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      );
}
