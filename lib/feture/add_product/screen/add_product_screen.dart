import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_appbar.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_elevate_btn.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_text_form_field.dart';
import 'package:ofline_database_with_hive/feture/add_product/controller/add_product_controller.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(
          title: "Add Data",
          centerTitle: true,
          barHeight: 60.h,
          color: Colors.blueGrey,
          leding: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(CupertinoIcons.back, color: Colors.white),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            children: [
              CustomTextFormField(
                controller: controller.idController,
                hintText: "Id",
                prefixIcon: Icons.numbers,
                type: TextInputType.numberWithOptions(),
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
              ),
              Gap(10.h),
              CustomTextFormField(
                controller: controller.titleController,
                hintText: "Title",
                prefixIcon: Icons.title,
              ),
              Gap(10.h),
              CustomTextFormField(
                controller: controller.descrController,
                hintText: "Descreption",
                prefixIcon: Icons.description,
              ),
              Gap(10.h),
              CustomTextFormField(
                controller: controller.priceController,
                hintText: "Price",
                prefixIcon: Icons.price_change,
                type: TextInputType.numberWithOptions(),
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
              ),
              Gap(60.h),
              CustomElevateBtn(
                ontap: () {
                  controller.savePost(context);
                  // Get.toNamed(AppRoute.nevBar);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
