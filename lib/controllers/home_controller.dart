import 'package:get/get.dart';
import 'package:getx/models/post_model.dart';
import 'package:getx/pages/creat_page.dart';
import 'package:getx/pages/update_page.dart';
import 'package:getx/services/http_service.dart';
import 'package:getx/services/log_service.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  List<Post> posts = [];

  loadPosts() async {
    isLoading = true;
    update();

    var response = await Network.GET(Network.API_POST_LIST, Network.paramsEmpty());
    // LogService.d(response!);
    List<Post> postList = Network.parsePostList(response!);

    posts = postList;
    isLoading = false;
    update();
  }

  deletePost(Post post) async {
    isLoading = true;
    update();

    var response = await Network.DEL(
        Network.API_POST_DELETE + post.id.toString(), Network.paramsEmpty());
    LogService.d(response!);
    loadPosts();
  }

  Future callCreatePage() async {
    bool result = await Get.to(const CreatePage());

    if (result) {
      loadPosts();
    }
  }

  Future callUpdatePage(Post post) async {
    bool result = await Get.to(UpdatePage(post: post));

    if (result) {
      loadPosts();
    }
  }

  Future<void> handleRefresh() async {
    loadPosts();
  }
}
