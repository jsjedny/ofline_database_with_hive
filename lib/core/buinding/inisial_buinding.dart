import 'package:get/get.dart';
import 'package:ofline_database_with_hive/feture/add_product/controller/add_product_controller.dart';

import 'package:ofline_database_with_hive/feture/home/controller/home_controller.dart';
import 'package:ofline_database_with_hive/feture/nev_bar/controller/nev_bar_controller.dart';
import 'package:ofline_database_with_hive/feture/product_detail/controller/product_controller.dart';
import 'package:ofline_database_with_hive/feture/splash/controller/splash_controller.dart';

class InisialBuinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<AddProductController>(
      () => AddProductController(),
      fenix: true,
    );
    Get.lazyPut<NevBarController>(() => NevBarController(), fenix: true);
    Get.lazyPut<ProductController>(() => ProductController(), fenix: true);
  }
}
