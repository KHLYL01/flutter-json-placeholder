import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_placeholder/core/constants/app_text_style.dart';
import 'package:json_placeholder/core/extensions/widget_extension.dart';
import 'package:json_placeholder/core/widgets/custom_button.dart';
import 'package:json_placeholder/core/widgets/custom_progress_indicator.dart';
import 'package:json_placeholder/core/widgets/custom_text_form_field.dart';
import 'package:json_placeholder/features/posts/presentation/controllers/post_controller.dart';

import '../../../../core/widgets/custom_error_widget.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PostController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post Details",
          style: AppTextStyle.bold20(),
        ),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const CustomProgressIndicator();
          }

          if (controller.errMessage.isNotEmpty) {
            return ErrorWidgetWithRetry(
              errorMessage: controller.errMessage.value,
              onRetry: () {
                Get.back();
              },
            );
          }

          return ListView(
            children: [
              customTextFormField(
                hint: "Title",
                icon: Icons.text_fields,
                textController: controller.title,
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              customTextFormField(
                hint: "Body",
                icon: Icons.textsms,
                textController: controller.body,
                maxLines: 10,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  customButton(
                    title: "Edit",
                    onPressed: () => controller.updatePost(),
                  ).expanded(flex: 1),
                  const SizedBox(width: 16),
                  customButton(
                    title: "Delete",
                    onPressed: () => controller.deleteById(),
                    color: Colors.red,
                  ).expanded(flex: 1),
                ],
              )
            ],
          ).paddingSymmetric(horizontal: 16);
        },
      ),
    );
  }
}
