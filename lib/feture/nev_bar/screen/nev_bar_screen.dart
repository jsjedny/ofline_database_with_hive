import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ofline_database_with_hive/feture/nev_bar/controller/nev_bar_controller.dart';

class NevBarScreen extends GetView<NevBarController> {
  const NevBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screen[controller.curratInx]),
      bottomNavigationBar: Obx(() {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.sp),
            topRight: Radius.circular(35.sp),
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.curratInx,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.blueGrey,
              iconSize: 24,
              onTap: controller.changeInx,
              items: [
                _buildBarItem(
                  CupertinoIcons.home,
                  "Home",
                  controller.curratInx == 0,
                ),
                _buildBarItem(
                  CupertinoIcons.delete,
                  "Delete",
                  controller.curratInx == 1,
                ),
                _buildBarItem(
                  CupertinoIcons.printer,
                  "Hestory",
                  controller.curratInx == 2,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

BottomNavigationBarItem _buildBarItem(
  IconData icon,
  String text,
  bool isSelected,
) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Icon(icon, color: isSelected ? Colors.white : Colors.grey),
    ),
    activeIcon: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Icon(icon, color: Colors.white),
    ),

    label: text,
  );
}
