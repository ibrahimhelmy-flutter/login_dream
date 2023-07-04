import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:login_dream/app/modules/login/bindings/login_binding.dart';

import 'app/core/constants/constant.dart';
import 'app/core/helper/storage_helper.dart';
import 'app/core/theme/inital.dart';
import 'app/core/translation/initial.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await initServices();

  runApp(GetMaterialApp(
    title: "code Help",
    initialRoute: Routes.LOGIN,
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,
    translations: AppTranslation(),
    locale: Locale(Box.get(key: AppConst.localeKey) ?? "ar"),
    fallbackLocale: const Locale('ar'),
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('ar'),
      Locale('en'),
    ],
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: .9),
        child: Scaffold(
          body: InkWell(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: child,
          ),
        ),
      );
    },
    theme: AppThemeInitial.appTheme(),
    defaultTransition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 400),
    initialBinding: LoginBinding(),
  ));
}

initServices() async {
  log('starting services ...');

  log('All services started...');
}
