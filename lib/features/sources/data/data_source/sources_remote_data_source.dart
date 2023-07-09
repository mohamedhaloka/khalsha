import 'package:khalsha/features/blog/data/models/post_model.dart';

import '../../../../core/data/services/http_service.dart';
import '../../../../core/domain/error/exceptions.dart';
import '../../../blog/data/models/category_model.dart';
import '../models/resource_model.dart';

abstract class SourcesRemoteDataSource {
  Future<List<PostModel>> getList();
  Future<List<ResourceModel>> getResourceDetails(String itemId);
}

class SourcesRemoteDataSourceImpl extends SourcesRemoteDataSource {
  final HttpService _httpService;
  SourcesRemoteDataSourceImpl(this._httpService);

  @override
  Future<List<PostModel>> getList() async {
    final response = await _httpService.get('resource');
    if (response.statusCode == 200 && response.data['status']) {
      final List<CategoryModel> categories = <CategoryModel>[];

      for (var category in response.data['result']['data']) {}
      return [];
    } else {
      throw ServerException(errorMessage: response.data.toString());
    }
  }

  @override
  Future<List<ResourceModel>> getResourceDetails(String itemId) async {
    final response =
        await _httpService.get('resource?resource_list_id=$itemId');
    if (response.statusCode == 200 && response.data['status']) {
      final List<ResourceModel> resources = <ResourceModel>[];

      for (var resource in response.data['result']['data']) {
        resources.add(ResourceModel.fromJson(resource));
      }
      return resources;
    } else {
      throw ServerException(errorMessage: response.data.toString());
    }
  }
}
