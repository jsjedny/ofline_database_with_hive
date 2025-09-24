import 'package:get/get.dart';
import 'package:ofline_database_with_hive/feture/deleted_item/screen/deleted_item_screen.dart';
import 'package:ofline_database_with_hive/feture/hestory/screen/hestory_screen.dart';
import 'package:ofline_database_with_hive/feture/home/screen/home_screen.dart';

class NevBarController extends GetxController {
  var selectedInx = 0.obs;

  int get curratInx => selectedInx.value;

  List screen = [HomeScreen(), DeletedItemScreen(), HestoryScreen()];

  void changeInx(int index) {
    if (selectedInx.value == index) {
      return;
    }
    selectedInx.value = index;
  }

  void backToHome() {
    changeInx(0);
  }
}
