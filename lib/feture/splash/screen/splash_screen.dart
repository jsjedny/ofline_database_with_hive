import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_text.dart';
import 'package:ofline_database_with_hive/core/const/img_path.dart';
import 'package:ofline_database_with_hive/feture/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImgPath.splash, height: 160.h, width: 160.w),
            Gap(20.h),
            CustomText(
              text: "Loading...",
              size: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.green,
            ),
            Gap(20.h),
            SpinKitPouringHourGlass(color: Colors.green, size: 50.sp),
          ],
        ),
      ),
    );
  }
}
