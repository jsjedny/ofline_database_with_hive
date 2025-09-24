import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ofline_database_with_hive/core/common_widets/flutter_toast.dart';
import 'package:ofline_database_with_hive/feture/home/data/data_model/home_data_model.dart';
import 'package:ofline_database_with_hive/feture/home/data/rest_API/call_api.dart';

class HomeController extends GetxController {
  final RxList<Post> product = <Post>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isPaginating = false.obs;

  final CallApi api = CallApi();
  late Box<Post> postBox;
  late Box<Post> deletBox;
  late Box<Post> hestoryBox;

  int curLimit = 10;

  // get controller for edit data
  final editTitile = TextEditingController();
  final editDescrption = TextEditingController();
  final editPrice = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      postBox = Hive.box<Post>('postsBox');
      deletBox = Hive.box<Post>('deletedPostsBox');
      hestoryBox = Hive.box<Post>('allPostHestory');
      getData();
    });
  }

  void getData() async {
    isLoading.value = true;
    if (postBox.isNotEmpty) {
      product.value = postBox.values.take(curLimit).toList();
      isLoading.value = false;
      sucessToast('Data showing Offline');
    } else {
      try {
        isLoading.value = true;
        final List<Post> productData = await api.fetchData();
        product.value = productData.take(curLimit).toList();
        sucessToast('Data showing Online');

        await postBox.clear();
        await postBox.addAll(productData);
      } catch (e) {
        // print("Error $e");
      } finally {
        isLoading.value = false;
      }
    }
  }

  void onScroll(double maxScroll, double currentScroll) {
    if (currentScroll >= maxScroll - 200) {
      loadMore();
    }
  }

  void loadMore() async {
    if (curLimit < postBox.length && !isPaginating.value) {
      isPaginating.value = true;

      await Future.delayed(Duration(seconds: 3));

      curLimit += 10;
      if (curLimit > postBox.length) {
        curLimit = postBox.length;
      }

      product.value = postBox.values.take(curLimit).toList();

      isPaginating.value = false;
    }
  }

  void deletePost(num id) async {
    var box = Hive.box<Post>("postsBox");
    var delatedBox = Hive.box<Post>("deletedPostsBox");
    var hestoryBox = Hive.box<Post>('allPostHestory');

    final post = box.get(id);

    if (post != null) {
      final newPost = Post(
        id: post.id,
        titile: post.titile,
        description: post.description,
        price: post.price,
        imgUrl: post.imgUrl,
        category: 'delated',
      );
      final hestoryPost = Post(
        id: post.id,
        titile: "⚠️ Now Delete A Post! Id : ${post.id}",
        description:
            "Make seur you delete ${post.id} data! Don't wary you can restore this on delete page!",
        price: post.price,
        category: "8:10 PM",
        imgUrl: post.category,
      );
      await delatedBox.put(id, newPost);
      await hestoryBox.put(id, hestoryPost);
      await box.delete(id);
    }

    getData();
  }

  void editPost(num id, String title, String descreption, String price) {
    if (title.isEmpty || descreption.isEmpty || price.isEmpty) {
      errorToast("Fill Up all filed");
      return;
    }
    try {
      num updatedPrice = num.parse(price);
      var box = Hive.box<Post>('postsBox');
      var editHestroy = Hive.box<Post>('allPostHestory');
      final oldPost = box.get(id);
      if (oldPost != null) {
        final editPost = Post(
          id: oldPost.id,
          titile: title,
          description: descreption,
          price: updatedPrice,
          category: oldPost.category,
          imgUrl: oldPost.imgUrl,
        );
        final hestoryPost = Post(
          id: id,
          titile: "✍️ Now Edit A Post! Id : $id",
          description:
              "Make seur you Edit $id data! Don't wary you can Edit more time go to home page!",
          price: oldPost.price,
          category: "8:10 PM",
          imgUrl: oldPost.imgUrl,
        );

        box.put(id, editPost);
        editHestroy.put(id, hestoryPost);
        getData();
        Get.back();
      }
    } catch (e) {
      errorToast("Error : Price Must be Number or:$e");
    }
  }
}
