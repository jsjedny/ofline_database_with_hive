import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevateBtn extends StatelessWidget {
  const CustomElevateBtn({
    super.key,
    required this.ontap,
    this.text,
    this.width,
    this.bgColor,
    this.height,
  });

  final VoidCallback ontap;
  final String? text;
  final double? width;
  final Color? bgColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 52.h,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: bgColor ?? Colors.blueGrey,
        ),
        child: Text(
          text ?? "Add Now",
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
