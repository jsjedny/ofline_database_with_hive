import 'package:get/get.dart';
import 'package:ofline_database_with_hive/feture/add_product/screen/add_product_screen.dart';
import 'package:ofline_database_with_hive/feture/nev_bar/screen/nev_bar_screen.dart';

import 'package:ofline_database_with_hive/feture/splash/screen/splash_screen.dart';

class AppRoute {
  static String splashScreen = "/splashScreen";
  static String nevBar = "/nevBar";
  static String addProduct = "/addProduct";
  // static String productDetail = "/productDetail";

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: nevBar, page: () => NevBarScreen()),
    GetPage(name: addProduct, page: () => AddProductScreen()),
    // GetPage(name: productDetail, page: () => ProductDetail()),
  ];
}
