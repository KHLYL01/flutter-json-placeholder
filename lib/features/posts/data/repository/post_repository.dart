import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/networks/api_service.dart';
import '../../../../core/networks/failures.dart';
import '../model/post_model.dart';

class PostRepository {
  final ApiService _apiService;

  PostRepository(this._apiService);

  Future<Either<Failure, List<PostModel>>> findAll() async {
    try {
      final httpResponse = await _apiService.findAllPosts();
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, PostModel>> findById(int id) async {
    try {
      final httpResponse = await _apiService.findPostById(id);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, PostModel>> save(PostModel request) async {
    try {
      final httpResponse = await _apiService.savePost(request);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      log(e.toString());
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, PostModel>> update(PostModel request) async {
    try {
      final httpResponse = await _apiService.updatePost(request);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteById(int id) async {
    try {
      final httpResponse = await _apiService.deletePostById(id);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
