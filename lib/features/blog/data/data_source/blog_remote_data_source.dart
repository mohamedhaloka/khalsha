import 'package:khalsha/features/blog/data/models/post_model.dart';

import '../../../../core/data/services/http_service.dart';
import '../../../../core/domain/error/exceptions.dart';
import '../models/category_model.dart';

abstract class BlogRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<PostModel>> getBlogByCategory(String categoryId);
  Future<List<PostModel>> blogSearch(String searchText);
}

class BlogRemoteDataSourceImpl extends BlogRemoteDataSource {
  final HttpService _httpService;
  BlogRemoteDataSourceImpl(this._httpService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await _httpService.get('blog/categories');
    if (response.statusCode == 200 && response.data['status']) {
      final List<CategoryModel> categories = <CategoryModel>[];

      for (var category in response.data['result']['result']) {
        categories.add(CategoryModel.fromJson(category));
      }
      return categories;
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<List<PostModel>> blogSearch(String searchText) async {
    final response = await _httpService.get('blog?search=$searchText');
    if (response.statusCode == 200 && response.data['status']) {
      final List<PostModel> posts = <PostModel>[];

      for (var category in response.data['result']['data']) {
        posts.add(PostModel.fromJson(category));
      }
      return posts;
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<List<PostModel>> getBlogByCategory(String categoryId) async {
    final response =
        await _httpService.get('blog?blog_category_id=$categoryId');
    if (response.statusCode == 200 && response.data['status']) {
      final List<PostModel> posts = <PostModel>[];

      for (var category in response.data['result']['data']) {
        posts.add(PostModel.fromJson(category));
      }
      return posts;
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
