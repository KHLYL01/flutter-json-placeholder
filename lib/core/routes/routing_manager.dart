import 'package:get/get.dart';

import '../../features/posts/presentation/pages/post_details_page.dart';
import '../../features/posts/presentation/pages/posts_page.dart';

class AppRoutes {
  static const posts = "/";
  static const postDetails = "/postDetails";
}

class RoutingManagement {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.posts,
      page: () => const PostsPage(),
    ),
    GetPage(
      name: AppRoutes.postDetails,
      page: () => const PostDetailsPage(),
    ),
  ];

  static toNamed(String route) {
    Get.toNamed(route);
  }

  static offNamed(String route) {
    Get.offNamed(route);
  }

  static offAllNamed(String route) {
    Get.offAllNamed(route);
  }
}
