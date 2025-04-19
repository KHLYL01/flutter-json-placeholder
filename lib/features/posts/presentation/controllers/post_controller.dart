import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_snack_bar.dart';
import '../../data/model/post_model.dart';
import '../../data/repository/post_repository.dart';

class PostController extends GetxController {
  final PostRepository _repository;

  PostController(this._repository);

  RxBool isLoading = false.obs;
  RxString errMessage = "".obs;

  RxList<PostModel> posts = <PostModel>[].obs;

  get length => posts.length;

  int userId = 0, id = 0;
  final TextEditingController title = TextEditingController();
  final TextEditingController body = TextEditingController();

  Future<void> findAll() async {
    isLoading(true);
    errMessage("");
    final data = await _repository.findAll();
    data.fold((l) => errMessage(l.eerMessage), (r) => posts(r));
    isLoading(false);

    if (errMessage.isNotEmpty) {
      customSnackBar(
        title: "Warning",
        message: errMessage.value,
        isDone: false,
      );
      return;
    }

    customSnackBar(title: "Done", message: "Fetch Posts Successfully");
  }

  Future<void> findPostById(int id) async {
    isLoading(true);
    errMessage("");
    final data = await _repository.findById(id);
    data.fold((l) => errMessage(l.eerMessage), (r) => fillController(r));
    isLoading(false);
    if (errMessage.isNotEmpty) {
      customSnackBar(
        title: "Warning",
        message: errMessage.value,
        isDone: false,
      );
      return;
    }
    customSnackBar(title: "Done", message: "Fetch Post Successfully");
  }

  Future<void> save() async {
    isLoading(true);
    errMessage("");
    final data = await _repository.save(
      PostModel(
        userId: 1, //  value for test
        title: title.text,
        body: body.text,
      ),
    );
    data.fold((l) => errMessage(l.eerMessage), (r) => r);
    isLoading(false);

    if (errMessage.isNotEmpty) {
      customSnackBar(
        title: "Warning",
        message: errMessage.value,
        isDone: false,
      );
      return;
    }
    Get.back();
    customSnackBar(title: "Done", message: "Post Added Successfully");
    findAll();
  }

  Future<void> updatePost() async {
    isLoading(true);
    errMessage("");
    final data = await _repository.update(
      PostModel(
        id: id,
        userId: userId, //  value for test
        title: title.text,
        body: body.text,
      ),
    );
    data.fold((l) => errMessage(l.eerMessage), (r) => r);
    isLoading(false);
    if (errMessage.isNotEmpty) {
      customSnackBar(
        title: "Warning",
        message: errMessage.value,
        isDone: false,
      );
      return;
    }
    Get.back();
    customSnackBar(title: "Done", message: "Post Updated Successfully");
    findAll();
  }

  Future<void> deleteById() async {
    isLoading(true);
    errMessage("");
    final data = await _repository.deleteById(id);
    data.fold((l) => errMessage(l.eerMessage), (r) => r);
    isLoading(false);

    if (errMessage.isNotEmpty) {
      customSnackBar(
        title: "Warning",
        message: errMessage.value,
        isDone: false,
      );
      return;
    }
    Get.back();
    customSnackBar(title: "Done", message: "Post Deleted Successfully");
    findAll();
  }

  clearControllers() {
    id = 0;
    userId = 0;
    title.clear();
    body.clear();
  }

  fillController(PostModel r) {
    id = r.id ?? 0;
    userId = r.userId ?? 0;
    title.text = r.title ?? "";
    body.text = r.body ?? "";
  }

  @override
  void onInit() {
    findAll();
    super.onInit();
  }
}
