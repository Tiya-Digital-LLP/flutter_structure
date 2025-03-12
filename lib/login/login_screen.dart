import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:orderapp/generated/assets.dart';

import 'package:orderapp/login/controller/login_controller.dart';
import 'package:orderapp/utils/app_colors.dart';
import 'package:orderapp/utils/extension_classes.dart';
import 'package:orderapp/widget/border_text_field.dart';
import 'package:orderapp/widget/custom_app_bar.dart';
import 'package:orderapp/widget/custom_mobile_field.dart';
import 'package:orderapp/widget/normal_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          size: MediaQuery.of(context).size,
          titleText: 'Track Your Order',
          onTap: () {},
        ),
        body: SafeArea(
          child: Column(
            children: [
              SvgPicture.asset(Assets.svgLogin),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  color: AppColors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Obx(
                          () => BorderTextField(
                            keyboard: TextInputType.name,
                            textInputType: const [],
                            hint: "Order ID",
                            controller: controller.order.value,
                            isError: controller.orderError.value,
                            byDefault: !controller.isOrderTyping.value,
                            maxLength: 100,
                            onChanged: (value) {
                              controller.orderValidation();
                              controller.isOrderTyping.value = true;
                            },
                            height: 58,
                          ),
                        ),
                        15.sbh,

                        Obx(
                          () => CustomMobileField(
                            height: 58,
                            hint: "Mobile Number",
                            controller: controller.mobile.value,
                            textInputType: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboard: TextInputType.phone,
                            isError: controller.mobileError.value,
                            byDefault: !controller.isMobileTyping.value,
                            onChanged: (value) {
                              controller.mobileValidation();
                              controller.isMobileTyping.value = true;
                            },
                          ),
                        ),
                        20.sbh,
                        NormalButton(
                          height: 50,
                          onPressed: () {
                            controller.loginValidation(
                              context,
                              controller.mobile.value.text,
                            );
                          },
                          text: 'Track Order',
                          isLoading: controller.isLoading,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
            ],
          ),
        ),
      ),
    );
  }
}
