import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_appbar.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_text.dart';
import 'package:ofline_database_with_hive/core/const/img_path.dart';
import 'package:ofline_database_with_hive/core/util/custom_alart_dilog.dart';
import 'package:ofline_database_with_hive/feture/home/data/data_model/home_data_model.dart';

class HestoryScreen extends StatelessWidget {
  const HestoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hestoryBox = Hive.box<Post>('allPostHestory');
    return Scaffold(
      appBar: CustomAppbar(
        title: "Hestory",
        centerTitle: true,
        barHeight: 60.h,
        color: Colors.blueGrey,
        action: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 16.0),
            child: IconButton(
              onPressed: () {
                alartDaiog(context, () => Get.back(), () {
                  hestoryBox.clear();
                  Get.back();
                });
              },
              icon: Icon(CupertinoIcons.delete, color: Colors.white),
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: hestoryBox.listenable(),
        builder: (context, value, child) {
          if (hestoryBox.isEmpty) {
            return Center(
              child: Image.asset(
                ImgPath.noHestory,
                width: 200.w,
                height: 200.h,
              ),
            );
          }
          return ListView.builder(
            itemCount: hestoryBox.length,
            padding: EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              final post = hestoryBox.getAt(index);
              return Dismissible(
                key: Key(post!.titile + index.toString()),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  hestoryBox.deleteAt(index);
                  Get.snackbar(
                    "Sucess",
                    "Sucessfully delete you hestoy!",
                    duration: Duration(seconds: 2),
                  );
                },
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.red,
                  ),
                  // alignment: Alignment.centerRight,
                  child: Icon(
                    CupertinoIcons.delete,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                ),
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    title: CustomText(
                      text: post.titile,
                      size: 18.sp,
                      align: TextAlign.start,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                      maxLine: 1,
                    ),
                    subtitle: CustomText(
                      text: post.description,
                      size: 11.sp,
                      align: TextAlign.start,
                      color: Colors.blueGrey.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                      maxLine: 2,
                    ),
                    trailing: Text(
                      post.category,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
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
