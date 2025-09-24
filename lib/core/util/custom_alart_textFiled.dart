import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_elevate_btn.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_text.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_text_form_field.dart';

void textFieldDailog(
  BuildContext context,
  VoidCallback onTap,
  TextEditingController editTitleControler,
  TextEditingController editDescreptionController,
  TextEditingController editPriceController,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
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
                text: "Edit this item",
                size: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5),
              ),
              Gap(30.h),

              CustomTextFormField(
                controller: editTitleControler,
                hintText: "Edit Title",
                prefixIcon: Icons.edit,
              ),
              Gap(10.h),
              CustomTextFormField(
                controller: editDescreptionController,
                hintText: "Edit Descreption",
                prefixIcon: Icons.edit,
              ),
              Gap(10.h),
              CustomTextFormField(
                controller: editPriceController,
                hintText: "Edit Price",
                prefixIcon: Icons.edit,
                type: TextInputType.numberWithOptions(),
              ),
              Gap(40.h),
              CustomElevateBtn(
                ontap: onTap,
                text: "Save",
                width: double.infinity,
                bgColor: Colors.green,
                height: 50.h,
              ),
            ],
          ),
        ),
      );
    },
  );
}
