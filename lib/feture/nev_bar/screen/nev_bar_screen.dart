import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ofline_database_with_hive/feture/nev_bar/controller/nev_bar_controller.dart';

class NevBarScreen extends GetView<NevBarController> {
  const NevBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screen[controller.curratInx]),

      floatingActionButton: SizedBox(
        height: 50.h,
        width: 50.w,
        child: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () => controller.changeInx(2),
          backgroundColor: Colors.green,
          child: const Icon(CupertinoIcons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          height: 65.h,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          color: Colors.blueGrey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBarItem(
                icon: CupertinoIcons.home,
                text: "Home",
                isSelected: controller.curratInx == 0,
                onTap: () => controller.changeInx(0),
              ),
              _buildBarItem(
                icon: CupertinoIcons.delete,
                text: "Delete",
                isSelected: controller.curratInx == 1,
                onTap: () => controller.changeInx(1),
              ),
              Gap(10.w),
              _buildBarItem(
                icon: CupertinoIcons.printer,
                text: "History",
                isSelected: controller.curratInx == 3,
                onTap: () => controller.changeInx(3),
              ),
              _buildBarItem(
                icon: CupertinoIcons.person,
                text: "Account",
                isSelected: controller.curratInx == 4,
                onTap: () => controller.changeInx(4),
              ),
            ],
          ),
        );
      }),
    );
  }
}

Widget _buildBarItem({
  required IconData icon,
  required String text,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isSelected ? Colors.white : Colors.grey),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
      ],
    ),
  );
}
