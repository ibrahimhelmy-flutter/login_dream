import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:login_dream/app/core/constants/constant.dart';

import '../../../core/Image/image_utils.dart';
import '../../../core/base/custom_button.dart';
import '../../../core/base/custom_textformfield.dart';
import '../../../core/helper/app_validator.dart';
import '../../../core/theme/colors.dart';
import '../../../core/translation/initial.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginFormK = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        systemOverlayStyle: AppConst.systemUiOverlayStyleBlack,
        backgroundColor: AppColors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          TextButton(
              onPressed: () => AppTranslation().changeLange(),
              child: Text(
                'lang'.tr,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: AppTranslation.isArabic ? 16 : 18,
                  color: const Color(0xff525252),
                ),
                textAlign: TextAlign.right,
                softWrap: false,
              ))
        ],
        leading: IconButton(
            onPressed: () {Get.back();}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Form(
                  key: loginFormK,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(flex: 1, child: SizedBox()),
                        20.ph,
                        ImageUtils.showNetImageWhClip(
                            asset: "assets/img/logo.png",
                            width: 140,
                            height: 130),
                        20.ph,
                        Text(
                          "old_user".tr,
                          style: const TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 24,
                            color: Color(0xff344057),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        ),
                        25.ph,
                        Row(
                          children: [
                            Text(
                              "phone".tr,
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 20,
                                color: Color(0xff525252),
                              ),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            ),
                          ],
                        ),
                        5.ph,
                        CustomTextFormField(
                          controller: TextEditingController(),
                          borderColor: AppColors.borderColor,
                          keyboardType: TextInputType.phone,
                          // textInputAction: TextInputAction.done,
                          validator: (val) => AppValid.validPhone(val),
                          borderRadius: 40,
                          height: 18,
                          hint: 'from_8_char'.tr,
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            color: Color(0xff525252),
                            fontWeight: FontWeight.w300,
                          ),
                          icon: const SizedBox(
                            height: 15,
                            width: 15,
                            child: Icon(Icons.phone),
                          ),
                        ),
                        50.ph,
                        Obx(
                              () => CustomProgressButton(
                            value: "login".tr,
                            disabledColor: AppColors.borderColor,
                            activeColor: Colors.black,
                            onPressed: () =>
                                controller.login(context, loginFormK),
                            isLoading: controller.loading.value,
                            border: 40,
                            height: 60,
                            textStyle: (_) => const TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 26,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        const Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 10,
                            )),
                        Center(
                          child: InkWell(
                            onTap: () {
                              // Get.toNamed(Routes.REGISTER);
                            },
                            child: Container(
                              height: 65,
                              width: 260,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                  border:
                                  Border.all(color: AppColors.borderColor),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(-2, 3),
                                    )
                                  ]),
                              child: Center(
                                child: Text(
                                  "new_user".tr,
                                  style: const TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 22,
                                    color: Color(0xff1e1e1e),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                ),
                              ),
                            ),
                          ),
                        ),
                        30.ph
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
