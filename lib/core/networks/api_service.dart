import 'package:dio/dio.dart';
import 'package:json_placeholder/core/networks/api_constant.dart';
import 'package:json_placeholder/features/posts/data/model/post_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  ///
  /// Post Api
  ///

  @GET(ApiConstant.posts)
  Future<HttpResponse<List<PostModel>>> findAllPosts();

  @GET("${ApiConstant.posts}/{id}")
  Future<HttpResponse<PostModel>> findPostById(@Path("id") int id);

  @POST(ApiConstant.posts)
  Future<HttpResponse<PostModel>> savePost(
      @Body(nullToAbsent: true) PostModel request);

  @PUT(ApiConstant.posts)
  Future<HttpResponse<PostModel>> updatePost(
      @Body(nullToAbsent: true) PostModel request);

  @DELETE("${ApiConstant.posts}/{id}")
  Future<HttpResponse<void>> deletePostById(@Path("id") int id);
}
