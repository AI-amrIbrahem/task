import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task/features/auth/presentation/controllers/login_controller.dart';
import 'package:task/features/widgets/text_input_field.dart';
import 'package:task/utils/resources/ColorsUtils.dart';
import 'package:task/utils/resources/app_assets.dart';
import 'package:task/utils/resources/app_font.dart';
import 'package:task/utils/resources/validate.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: LoginController(),
        builder: (controller) => Stack(
          children: [
            Positioned(
              left: 0,
              top: MediaQuery.of(context).size.height / 3,
              right: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 50, sigmaX: 55),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                    color: AppColors.color2,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: -MediaQuery.of(context).viewPadding.top,
              left: -MediaQuery.of(context).size.width / 1.5,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 50, sigmaX: 55),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                    color: AppColors.color3,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: -MediaQuery.of(context).viewPadding.top,
              right: -MediaQuery.of(context).size.width / 1.5,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 50, sigmaX: 55),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                    color: AppColors.color1,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 42.w,
              left: 42.w,
              bottom: MediaQuery.of(context).size.height / 4 - 100.h,
              child:
                  Image.asset(AppAssets.gallery1, height: 150.h, width: 150.w),
            ),
            Positioned(
              right: 42.w + 200.w,
              left: 42.w,
              bottom: MediaQuery.of(context).size.height / 4 + 50.h,
              child:
                  Image.asset(AppAssets.gallery2, height: 150.h, width: 150.w),
            ),
            Positioned(
              right: 42.w,
              left: 42.w + 200.w,
              bottom: MediaQuery.of(context).size.height / 4,
              child:
                  Image.asset(AppAssets.bubbles, height: 200.h, width: 300.w),
            ),
            Positioned(
              right: 42.w,
              left: 42.w,
              bottom: MediaQuery.of(context).size.height / 4 - 100.h,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 42.w),
                  height: 345.h,
                  decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(.3),
                      borderRadius: BorderRadius.circular(32)),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'LOG IN',
                          style: TextStyle(
                              fontSize: AppScreenUtil.f20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.titleColor),
                        ),
                        SizedBox(
                          height: AppScreenUtil.h10,
                        ),
                        TextInputField(
                          hintText: 'Email',
                          type: TextInputType.text,
                          textController: controller.userNameController,
                          validator: (value) {
                            return AppValidator.isValidName(value);
                          },
                        ),
                        SizedBox(
                          height: AppScreenUtil.h10,
                        ),
                        TextInputField(
                          hintText: 'Password',
                          type: TextInputType.text,
                          obscureText: true,
                          textController: controller.passwordController,
                          validator: (value) {
                            return AppValidator.isValidName(value);
                          },
                        ),
                        MaterialButton(
                          minWidth: 282.42.w,
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.login(
                                  context: context,
                                  email: controller.userNameController.text,
                                  password: controller.passwordController.text);
                            }
                          },
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white),
                          ),
                          color: AppColors.button,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: MediaQuery.of(context).size.height / 4 + 300.h,
              child: Text(
                '''My
 Gellary''',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppScreenUtil.f40,
                    color: AppColors.titleColor),
              ),
            ),
            Positioned(
                right: 0,
                top: -MediaQuery.of(context).size.height / 4,
                left: -MediaQuery.of(context).size.width / 2,
                child: SvgPicture.asset(
                  AppAssets.svgLoginCircle,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                )),
            Positioned(
                right: 0,
                top: 58.8.h,
                left: -MediaQuery.of(context).size.width / 2,
                child: Image.asset(
                  AppAssets.camera,
                  height: 100.0.w,
                  width: 100.0.h,
                )),
          ],
        ),
      ),
    );
  }
}
