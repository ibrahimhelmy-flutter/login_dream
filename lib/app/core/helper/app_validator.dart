import 'package:get/get.dart';

class AppValid{


  static String? validPhone(val) {
    if (val==null||val.trim().isEmpty||val.length<8 || val.length > 13) {
      return "phone_error_message".tr;
    }
    return null;
  }

  static String? validName(val) {
    if (val!.length<3) {
      return "please_enter_name".tr;
    }
    return null;
  }
  static String? validCity(val) {
    if (val.trim().isEmpty) {
      return "select_city".tr;
    }
    return null;
  }



  static String? validEmail(val){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val??"");
    if(!emailValid){
      return "no_email".tr;
    }
    return null;
  }

  static String ? validPass(val) {
    if(val.trim().isEmpty||val.trim().length<6) {
      return 'passwordIsnotLessThan6Characters'.tr;
    }
    return null;
  }
  static String ? validConfirmPass({required String val, required String pass}) {
    if(val.isEmpty) {
      return 'passwordIsnotLessThan6Characters'.tr;
    }
    if(val != pass) {
      return 'NotـMatch'.tr;
    }

    return null;
  }
}