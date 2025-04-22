import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:json_placeholder/core/networks/dio_factory.dart';

import '../../features/posts/data/repository/post_repository.dart';
import '../../features/posts/presentation/controllers/post_controller.dart';
import '../networks/api_service.dart';

class DependenceInitializer {
  static dependenceInjection() {
    // Dio DI
    Get.lazyPut<Dio>(() => DioFactory.getDio(), fenix: true);

    // Api Service
    Get.lazyPut<ApiService>(() => ApiService(Get.find()));

    // Posts DI
    Get.lazyPut<PostRepository>(() => PostRepository(Get.find()));

    Get.put(PostController(Get.find()));
  }
}
