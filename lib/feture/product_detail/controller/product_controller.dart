import 'package:get/get.dart';

class ProductController extends GetxController {
  final RxMap<String, dynamic> retingData = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    setRatingData();
  }

  void setRatingData() {
    retingData.value = {"5": 0.9, "4": 0.7, "3": 0.5, "2": 0.3, "1": 0.01};
  }
}
