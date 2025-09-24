import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_appbar.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_text.dart';
import 'package:ofline_database_with_hive/core/common_widets/simmer_card.dart';
import 'package:ofline_database_with_hive/core/util/custom_alart_dilog.dart';
import 'package:ofline_database_with_hive/core/util/custom_alart_textFiled.dart';
import 'package:ofline_database_with_hive/feture/home/controller/home_controller.dart';
import 'package:ofline_database_with_hive/feture/product_detail/screen/product_detail.dart';
import 'package:ofline_database_with_hive/route/app_route.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.find<HomeController>();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      controller.onScroll(
        scrollController.position.maxScrollExtent,
        scrollController.position.pixels,
      );
    });
    return Scaffold(
      appBar: CustomAppbar(
        title: "Show Data",
        centerTitle: true,
        barHeight: 60.h,
        color: Colors.blueGrey,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoute.addProduct),
        backgroundColor: Colors.green,
        child: Icon(Icons.add, color: Colors.white),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return SpinKitCircle(color: Colors.green, size: 50.sp);
        }
        if (controller.product.isEmpty) {
          return Center(
            child: CustomText(text: "Data Not Found", size: 20.sp),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => controller.getData(),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsetsGeometry.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.2 / 3,
                  ),

                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index >= controller.product.length) {
                        return const ShimmerItem();
                      }
                      final data = controller.product[index];
                      return InkWell(
                        onTap: () {
                          Get.to(
                            ProductDetail(
                              title: data.titile,
                              descreption: data.description,
                              image: data.imgUrl,
                              price: data.price,
                            ),
                          );
                          // sucessToast("${data.id}");
                        },

                        child: Card(
                          elevation: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                data.imgUrl,
                                width: double.infinity,
                                height: 100.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 5,
                                  left: 10,
                                  right: 5,
                                ),
                                child: CustomText(
                                  text: data.titile,
                                  size: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  maxLine: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 5,
                                  left: 10,
                                  right: 5,
                                ),
                                child: CustomText(
                                  text: data.description,
                                  size: 10.sp,
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w400,
                                  maxLine: 2,
                                  align: TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 5,
                                  left: 10,
                                  right: 5,
                                ),
                                child: CustomText(
                                  text: "${data.price}",
                                  size: 16.sp,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w600,
                                  maxLine: 2,
                                  align: TextAlign.start,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      textFieldDailog(
                                        context,
                                        () {
                                          controller.editPost(
                                            data.id,
                                            controller.editTitile.text,
                                            controller.editDescrption.text,

                                            controller.editPrice.text,
                                          );
                                          controller.editTitile.clear();
                                          controller.editDescrption.clear();
                                          controller.editPrice.clear();
                                          FocusScope.of(context).unfocus();
                                        },
                                        controller.editTitile,
                                        controller.editDescrption,
                                        controller.editPrice,
                                      );
                                    },
                                    icon: Icon(Icons.edit, color: Colors.green),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      alartDaiog(
                                        context,
                                        () {
                                          Get.back();
                                        },
                                        () {
                                          controller.deletePost(data.id);
                                          Get.back();
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount:
                        controller.product.length +
                        (controller.isPaginating.value ? 2 : 0),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
