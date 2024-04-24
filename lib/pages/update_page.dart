import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/update_controller.dart';
import 'package:getx/models/post_model.dart';

class UpdatePage extends StatefulWidget {
  final Post post;

  const UpdatePage({super.key, required this.post});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final UpdateController updateController = Get.find<UpdateController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateController.titleController.text = widget.post.title!;
    updateController.bodyController.text = widget.post.body!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Update Post"),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: updateController.titleController,
                  decoration: const InputDecoration(hintText: "Title"),
                ),
              ),
              Container(
                child: TextField(
                  controller: updateController.bodyController,
                  decoration: const InputDecoration(hintText: "Body"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    updateController.updatePost(widget.post);
                  },
                  child: const Text("Update"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
