import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getx/controllers/home_controller.dart';
import 'package:getx/models/post_model.dart';

Widget itemOfPost(Post post, HomeController homeController) {
  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            homeController.callUpdatePage(post);
          },
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            homeController.deletePost(post);
          },
          backgroundColor: const Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            post.body!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          const Divider(),
        ],
      ),
    ),
  );
}
