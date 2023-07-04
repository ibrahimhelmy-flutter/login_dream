import 'dart:developer';

import 'package:example/app/modules/home/bindings/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  await initServices();

  runApp(GetMaterialApp(
    title: "code Help",
    initialRoute: Routes.HOME,
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,

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

    defaultTransition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 400),
    initialBinding: HomeBinding(),
  ));
}

initServices() async {
  log('starting services ...');

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  log('All services started...');
}
