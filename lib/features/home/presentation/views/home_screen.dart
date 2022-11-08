import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task/features/auth/presentation/controllers/login_controller.dart';
import 'package:task/features/auth/presentation/views/login_screen.dart';
import 'package:task/features/home/presentation/controllers/home_controller.dart';
import 'package:task/features/home/presentation/views/widgets/background_widget.dart';
import 'package:task/features/home/presentation/views/widgets/upload_dialog.dart';
import 'package:task/utils/resources/ColorsUtils.dart';
import 'package:task/utils/resources/app_assets.dart';
import 'package:task/utils/resources/app_font.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var homeController = Get.put(HomeController())
    ..getGallery(userToken: userModel!.token);

  @override
  Widget build(BuildContext context) {
    homeController.getGallery(userToken: userModel!.token);
    return Scaffold(
      body: GetBuilder(
        init: homeController,
        builder: (controller) => Stack(
          children: [
            BackGroundWidget(),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: AppScreenUtil.h10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '''Welcome
${userModel!.user.name}''',
                        style: TextStyle(fontSize: AppScreenUtil.f30),
                      ),
                      SizedBox(
                          width: AppScreenUtil.w66,
                          height: AppScreenUtil.h66,
                          child: CircleAvatar(
                            child: Image.asset(AppAssets.camera),
                            backgroundColor: AppColors.white,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: AppScreenUtil.h40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAll(LoginScreen());
                          userModel = null;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil.w14,
                              vertical: AppScreenUtil.h5),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.logoutIcon,
                                height: AppScreenUtil.h30,
                                width: AppScreenUtil.w30,
                              ),
                              SizedBox(
                                width: AppScreenUtil.w10,
                              ),
                              Text(
                                'log out',
                                style: TextStyle(fontSize: AppScreenUtil.f20),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              barrierColor: Colors.white.withOpacity(0),
                              context: context,
                              builder: (ctx) => UploadDialogWidget(
                                  homeController: homeController));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil.w14,
                              vertical: AppScreenUtil.h5),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.upload,
                                height: AppScreenUtil.h30,
                                width: AppScreenUtil.w30,
                              ),
                              SizedBox(
                                width: AppScreenUtil.w10,
                              ),
                              Text(
                                'upload',
                                style: TextStyle(fontSize: AppScreenUtil.f20),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: AppScreenUtil.h30,
                  ),
                  Expanded(
                    child: AlignedGridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      itemCount: homeController.images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: AppScreenUtil.h108,
                          width: AppScreenUtil.w108,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              image: DecorationImage(
                                image:
                                    NetworkImage(homeController.images[index]),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
