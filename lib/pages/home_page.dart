import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/home_controller.dart';
import 'package:getx/views/item_of_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text("GetX"),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (homeController) {
          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: homeController.handleRefresh,
                child: ListView.builder(
                  itemCount: homeController.posts.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: itemOfPost(
                          homeController.posts[index], homeController),
                    );
                  },
                ),
              ),
              homeController.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          homeController.callCreatePage();
        },
      ),
    );
  }
}
