import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ofline_database_with_hive/core/common_widets/custom_appbar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Account",
        centerTitle: true,
        barHeight: 60.h,
        color: Colors.blueGrey,
      ),
    );
  }
}
