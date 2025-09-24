import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.leding,
    this.action,
    this.titileSpacing,
    this.centerTitle,
    this.barHeight,
    this.color,
  });

  final String title;
  final Widget? leding;
  final List<Widget>? action;
  final double? titileSpacing;
  final bool? centerTitle;
  final double? barHeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25.sp,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: leding,
      actions: action,
      centerTitle: centerTitle ?? false,
      titleSpacing: titileSpacing,
      backgroundColor: color ?? Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.sp),
          bottomRight: Radius.circular(35.sp),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(barHeight ?? kToolbarHeight);
}
