import 'package:get/get.dart';
import 'package:ofline_database_with_hive/route/app_route.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    goToNextPage();
    super.onInit();
  }

  void goToNextPage() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoute.nevBar);
    });
  }
}
