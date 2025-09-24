import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ofline_database_with_hive/core/buinding/inisial_buinding.dart';
import 'package:ofline_database_with_hive/feture/home/data/data_model/home_data_model.dart';
import 'package:ofline_database_with_hive/route/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PostAdapter());
  await Hive.openBox<Post>('postsBox');
  await Hive.openBox<Post>('deletedPostsBox');
  await Hive.openBox<Post>('allPostHestory');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: Size(390, 844),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: InisialBuinding(),
        getPages: AppRoute.routes,
        initialRoute: AppRoute.splashScreen,
      ),
    );
  }
}
