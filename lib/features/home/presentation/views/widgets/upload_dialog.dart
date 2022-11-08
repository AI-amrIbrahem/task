import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/features/auth/presentation/controllers/login_controller.dart';
import 'package:task/features/home/presentation/controllers/home_controller.dart';
import 'package:task/utils/resources/ColorsUtils.dart';
import 'package:task/utils/resources/app_assets.dart';
import 'package:task/utils/resources/app_font.dart';

class UploadDialogWidget extends StatelessWidget {
  const UploadDialogWidget({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: AppColors.white.withOpacity(0),
      content: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
          child: Container(
            height: 270.h,
            width: 270.w,
            padding: EdgeInsets.symmetric(horizontal: 42.w),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.white),
                color: AppColors.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(32)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      Get.back();
                      homeController.uploadImage(
                          context: context,
                          userToken: userModel!.token,
                          filepath: image.path);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.buttonGellary,
                        borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil.w10,
                        vertical: AppScreenUtil.h5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          AppAssets.gallery,
                          height: AppScreenUtil.h50,
                        ),
                        SizedBox(
                          width: AppScreenUtil.w10,
                        ),
                        Text(
                          'Gellary',
                          style: TextStyle(fontSize: AppScreenUtil.f20),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      Get.back();
                      homeController.uploadImage(
                          context: context,
                          userToken: userModel!.token,
                          filepath: image.path);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.buttonCamera,
                        borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil.w10,
                        vertical: AppScreenUtil.h5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(AppAssets.cameraButton,
                            height: AppScreenUtil.h50),
                        SizedBox(
                          width: AppScreenUtil.w10,
                        ),
                        Text(
                          'Camera',
                          style: TextStyle(fontSize: AppScreenUtil.f20),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
