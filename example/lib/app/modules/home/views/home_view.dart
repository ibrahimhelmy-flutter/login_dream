import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_dream/app/core/base/custom_textformfield.dart';
import 'package:login_dream/app/core/constants/constant.dart';
import 'package:login_dream/app/core/helper/app_validator.dart';
import 'package:login_dream/app/core/theme/colors.dart';
import 'package:login_dream/app/modules/login/views/login_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginDreamView(
      logoUrl: "assets/img/logo.png",
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blue,
        // leading: getBackBtn(),
        systemOverlayStyle: AppConst.systemUiOverlayStyleBlack,
      ),
      fields: [
        CustomTextFormField(
          borderColor: AppColors.borderColor,
          keyboardType: TextInputType.text,
          validator: (val) => AppValid.validPhone(val),
          borderRadius: 40,
          height: 18,
          hint: 'from_8_char'.tr,
          icon: const SizedBox(
            height: 15,
            width: 15,
            child: Icon(Icons.phone),
          ),
        ),
        const CustomTextFormField(
          borderColor: AppColors.borderColor,
          keyboardType: TextInputType.visiblePassword,
          validator: AppValid.validPass,
          isPassword: true,
          borderRadius: 20,
          height: 19,
          hint: 'كلمة السر',
          icon: SizedBox(width: 20, height: 20, child: Icon(Icons.lock)),
        ),
      ],
    );
  }
}
