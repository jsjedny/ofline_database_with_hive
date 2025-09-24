import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_appbar.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_expandable_text.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_text.dart';
import 'package:ofline_database_with_hive/feture/product_detail/controller/product_controller.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({
    super.key,
    required this.title,
    required this.descreption,
    required this.image,
    required this.price,
  });

  final String title;
  final String descreption;
  final String image;
  final num price;

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Product Detail",
        barHeight: 60.h,
        color: Colors.blueGrey,
        centerTitle: true,
        leding: Padding(
          padding: EdgeInsets.only(top: 5, left: 10),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(CupertinoIcons.back, color: Colors.white),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.only(top: 16.0, left: 20, right: 20, bottom: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                // color: Colors.blueGrey.withOpacity(0.5),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    image,
                    height: 250.h,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Gap(20.h),
              Row(
                children: [
                  CustomText(
                    text: "\$$price",
                    size: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepOrange,
                  ),
                  Gap(20.w),
                  Stack(
                    children: [
                      CustomText(
                        text: "\$99.9",
                        size: 12.sp,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 1.5.h,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(10.h),
              Divider(),
              Gap(10.h),
              CustomText(
                text: "Prouct title :",
                size: 14.sp,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                align: TextAlign.start,
              ),
              Gap(5.h),
              CustomText(
                text: title,
                size: 16.sp,
                maxLine: 1,
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              Gap(10.h),
              CustomText(
                text: "Product descreption :",
                size: 14.sp,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                align: TextAlign.start,
              ),
              Gap(5.h),
              CustomExpandableText(
                maxLine: 2,
                text: descreption,
                fontSize: 12.sp,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.w400,
              ),

              Gap(10.h),
              Divider(),
              Gap(10.h),
              CustomText(
                text: "Product Rating & Review :",
                size: 14.sp,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                align: TextAlign.start,
              ),
              // Gap(20.h),
              SizedBox(
                width: double.infinity,
                height: 200.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "4.5/5",
                          size: 35.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomText(
                          text: "(50 Reviews)",
                          size: 15.sp,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Gap(20.w),
                    Expanded(
                      child: Obx(() {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: controller.retingData.entries.map((e) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: "⭐ ${e.key}",
                                    size: 16.sp,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: e.value,
                                      minHeight: 6,
                                      backgroundColor: Colors.grey.shade300,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
