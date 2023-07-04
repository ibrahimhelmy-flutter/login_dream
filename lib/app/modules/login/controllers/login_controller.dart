import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  // TextEditingController phoneCont = TextEditingController();
  // TextEditingController passCount = TextEditingController();
  RxBool loading = false.obs;


  Future<void> login(BuildContext context, loginFormK) async {
    if (!loginFormK.currentState!.validate()) {
      return;
    }
    loginFormK.currentState!.save();
    Get.toNamed(
      Routes.OTP,
    ); // arguments: data.toJson()
    //get FCM Token
/*
    final notificationService = Get.find<NotificationsService>();
    loading(true);
    final token = await notificationService.getFCMToken();
    log('PUSH TOKEN Login: $token');
   */
    //callApi
    /*  (await _loginRequests.clientLogin(
        phone: phoneCont.text, loading: loading, fcmToken: "token"))
        .fold(
            (error) => PopUp.showAwesomeDialog(context,
            animType: AnimType.leftSlide,
            dialogType: DialogType.error,
            btnCancelText: 'back',
            content: (error.msg ?? '').tr),
            (data) => _navigate(data));*/
  }

/*  void _navigate(UserObj data) {
    if (phoneCont.text == '030030300') {
      UserData.instance.save(data.toJson());

      Get.offAllNamed(Routes.HOME);

      return;
    }

  }*/

  @override
  void onClose() {
    // phoneCont.dispose();
    // passCount.dispose();
    super.onClose();
  }

}
