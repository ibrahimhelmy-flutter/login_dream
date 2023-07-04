import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:login_dream/app/core/constants/constant.dart';

import '../../../core/Image/image_utils.dart';
import '../../../core/base/custom_button.dart';
import '../../../core/base/custom_textformfield.dart';
import '../../../core/theme/colors.dart';
import '../controllers/login_controller.dart';

class LoginDreamView extends GetView<LoginController> {
  // const LoginView({Key? key}) : super(key: key);
  const LoginDreamView({
    super.key,
    this.logoUrl,
    required this.appBar,
    required this.fields,
  });

  final List<CustomTextFormField> fields;
  final AppBar appBar;

  final String? logoUrl;



  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
    GlobalKey<FormState> loginFormK = GlobalKey<FormState>();
    return Scaffold(
      appBar: appBar,
      body: Form(
        key: loginFormK,
        child: SingleChildScrollView(
          child: Column(
            children: [
              logoUrl!=null?ImageUtils.showNetImageWhClip(
                  asset: logoUrl,
                  width: 140,
                  height: 130):SizedBox(),

              50.ph,
              ...fields,
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: CustomProgressButton(
                      value: "دخول".tr,
                      activeColor: AppColors.primaryColor,
                      disabledColor: AppColors.grayColor,
                      onPressed: () => controller.login(context, loginFormK),
                      isLoading: controller.loading.value,
                      height: 60,
                      border: 25,
                      textStyle: (_) => const TextStyle(
                            fontFamily: 'Almarai',
                            fontSize: 22,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            height: 0.8181818181818182,
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
