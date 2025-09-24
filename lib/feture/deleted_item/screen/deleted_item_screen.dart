import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_text.dart';

import 'package:ofline_database_with_hive/core/const/img_path.dart';
import 'package:ofline_database_with_hive/core/util/custom_alart_dilog.dart';
import 'package:ofline_database_with_hive/feture/home/data/data_model/home_data_model.dart';
import 'package:ofline_database_with_hive/feture/product_detail/screen/product_detail.dart';

import '../../../core/common_widets/custom_appbar.dart';

class DeletedItemScreen extends StatelessWidget {
  const DeletedItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var deletedBox = Hive.box<Post>('deletedPostsBox');
    return Scaffold(
      appBar: CustomAppbar(
        title: "Deleted Data",
        centerTitle: true,
        barHeight: 60.h,
        color: Colors.blueGrey,
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {
                alartDaiog(
                  context,
                  () {
                    Get.back();
                  },
                  () {
                    var box = Hive.box<Post>('deletedPostsBox');
                    box.clear();
                    Get.back();
                  },
                );
              },
              icon: Icon(CupertinoIcons.delete, color: Colors.white),
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: deletedBox.listenable(),
        builder: (context, value, child) {
          if (deletedBox.isEmpty) {
            return Center(
              child: Image.asset(ImgPath.noData, height: 250.h, width: 250.w),
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.7 / 3,
            ),
            padding: EdgeInsets.all(16.0),
            itemCount: deletedBox.length,
            itemBuilder: (context, index) {
              final post = deletedBox.getAt(index);
              return InkWell(
                onTap: () {
                  Get.to(
                    ProductDetail(
                      descreption: post.description,
                      title: post.titile,
                      price: post.price,
                      image: post.imgUrl,
                    ),
                  );
                  // sucessToast("${post.id}");
                },
                child: Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        post!.imgUrl,
                        width: double.infinity,
                        height: 100.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 10, right: 5),
                        child: CustomText(
                          text: post.titile,
                          size: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          maxLine: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 10, right: 5),
                        child: CustomText(
                          text: post.description,
                          size: 10.sp,
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          maxLine: 2,
                          align: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 10, right: 5),
                        child: CustomText(
                          text: "${post.price}",
                          size: 16.sp,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w600,
                          maxLine: 2,
                          align: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
