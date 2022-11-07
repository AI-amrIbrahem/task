import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/features/auth/presentation/controllers/login_controller.dart';
import 'package:task/features/home/presentation/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      GetBuilder(
        init: homeController,
        builder: (controller) =>  Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [

                    ]
                  )
                ),
                // child: Container(
                //   height: heightOfScreen,
                //   decoration: BoxDecoration(color: AppColors.greyShade2),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
