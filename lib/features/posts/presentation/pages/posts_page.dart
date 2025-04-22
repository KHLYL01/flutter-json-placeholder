import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_placeholder/core/constants/app_text_style.dart';
import 'package:json_placeholder/core/extensions/widget_extension.dart';
import 'package:json_placeholder/core/routes/routing_manager.dart';
import 'package:json_placeholder/core/widgets/custom_progress_indicator.dart';
import 'package:json_placeholder/features/posts/presentation/controllers/post_controller.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PostController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Posts Page",
          style: AppTextStyle.bold20(),
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const CustomProgressIndicator();
          }
          return ListView.separated(
            itemCount: controller.length,
            itemBuilder: (context, index) {
              var item = controller
                  .posts[controller.length - 1 - index]; // get reversed list
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.primaries[index % 18],
                  child: Text(
                    item.id.toString(),
                    style: AppTextStyle.bold20(color: Colors.white),
                  ),
                ),
                title: Text(
                  item.title ?? "",
                  style: AppTextStyle.semiBold18(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  item.body ?? "",
                  style: AppTextStyle.regular16(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  controller.clearControllers();
                  controller.findPostById(item.id!);
                  RoutingManagement.toNamed(AppRoutes.postDetails);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 16),
          ).paddingSymmetric(horizontal: 16);
        },
      ),
    );
  }
}
