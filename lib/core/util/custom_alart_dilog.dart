import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_elevate_btn.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_text.dart';

void alartDaiog(
  BuildContext context,
  VoidCallback noOntap,
  VoidCallback yesOntap,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: "Are You Seur?",
                size: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              CustomText(
                text: "Delete this item",
                size: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5),
              ),
              Gap(30.h),
              Row(
                children: [
                  CustomElevateBtn(
                    ontap: noOntap,
                    text: "NO",
                    width: 100.w,
                    bgColor: Colors.green,
                    height: 40.h,
                  ),
                  Spacer(),
                  CustomElevateBtn(
                    ontap: yesOntap,
                    text: "Yes",
                    width: 100.w,
                    bgColor: Colors.red,
                    height: 40.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
