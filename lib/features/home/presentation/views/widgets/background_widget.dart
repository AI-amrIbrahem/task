import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/utils/resources/ColorsUtils.dart';
import 'package:task/utils/resources/app_assets.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          child: Image.asset(AppAssets.gallery1, height: 150.h, width: 150.w),
        ),
        Positioned(
          right: 42.w + 200.w,
          left: 42.w,
          bottom: MediaQuery.of(context).size.height / 4 + 50.h,
          child: Image.asset(AppAssets.gallery2, height: 150.h, width: 150.w),
        ),
        Positioned(
          right: 42.w,
          left: 42.w + 200.w,
          bottom: MediaQuery.of(context).size.height / 4,
          child: Image.asset(AppAssets.bubbles, height: 200.h, width: 300.w),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
              child: SizedBox(
                  child: SvgPicture.asset(
                AppAssets.backVector,
                fit: BoxFit.fill,
                color: Colors.white38,
              ))),
        ),
      ],
    );
  }
}
