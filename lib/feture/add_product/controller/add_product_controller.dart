import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ofline_database_with_hive/core/common_widets/flutter_toast.dart';
import 'package:ofline_database_with_hive/feture/home/controller/home_controller.dart';
import 'package:ofline_database_with_hive/feture/home/data/data_model/home_data_model.dart';

class AddProductController extends GetxController {
  final idController = TextEditingController();
  final titleController = TextEditingController();
  final descrController = TextEditingController();
  final priceController = TextEditingController();

  void savePost(BuildContext context) async {
    final id = num.tryParse(idController.text);
    final price = num.tryParse(priceController.text);

    if (id == null || price == null) {
      errorToast("fill all filed");
      return;
    }
    if (titleController.text.isEmpty || descrController.text.isEmpty) {
      errorToast("fill all filed");
      return;
    }
    final post = Post(
      id: id,
      titile: titleController.text,
      description: descrController.text,
      price: price,
      category: "New Item",
      imgUrl: "https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_t.png",
    );
    var box = Hive.box<Post>("postsBox");
    await box.put(id, post);

    sucessToast("Data saved suesfully");
    idController.clear();
    priceController.clear();
    titleController.clear();
    descrController.clear();
    FocusScope.of(context).unfocus();

    final homeController = Get.find<HomeController>();
    homeController.getData();
  }
}
