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

      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.changeInx(1),
        heroTag: null,
        backgroundColor: Colors.redAccent,

        child: const Icon(CupertinoIcons.delete, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Obx(() {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
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
                  icon: CupertinoIcons.printer,
                  text: "History",
                  isSelected: controller.curratInx == 2,
                  onTap: () => controller.changeInx(2),
                ),
              ],
            ),
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
