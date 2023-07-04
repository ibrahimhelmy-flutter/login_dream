import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constant.dart';
import '../helper/storage_helper.dart';
import 'ar.dart';
import 'en.dart';

class AppTranslation extends Translations {
  static bool isArabic=Box.get(key: AppConst.localeKey)==null?true:Box.get(key: AppConst.localeKey)=="ar";
  void changeLange() {
    //toggle button
    isArabic=!isArabic;
    //save to DBStorage
    var code=isArabic?"ar":"en";
    Box.save(key:AppConst.localeKey,value:code);

    var local = Locale(code);
    Get.updateLocale(local);

  }

  void changeLangeWithCode({required String code}) {
    isArabic=code=="ar";
    Box.save(key:AppConst.localeKey,value:code);
    var local = Locale(code);
    Get.updateLocale(local);
  }

  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
