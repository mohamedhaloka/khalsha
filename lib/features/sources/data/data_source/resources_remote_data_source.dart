import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/features/blog/data/models/category_model.dart';
import 'package:khalsha/features/sources/data/models/resource_model.dart';

abstract class ResourcesRemoteDataSource {
  Future<List<CategoryModel>> getList();
  Future<List<ResourceModel>> getResourceDetails(String itemId);
}

class ResourcesRemoteDataSourceImpl extends ResourcesRemoteDataSource {
  final HttpService _httpService;
  ResourcesRemoteDataSourceImpl(this._httpService);

  @override
  Future<List<CategoryModel>> getList() async {
    final response = await _httpService.get('resource');
    if (response.statusCode == 200 && response.data['status']) {
      final List<CategoryModel> resources = <CategoryModel>[];

      for (var resource in response.data['result']['result']) {
        resources.add(CategoryModel.fromJson(resource));
      }
      return resources;
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<List<ResourceModel>> getResourceDetails(String itemId) async {
    final response =
        await _httpService.get('resource/list?resource_list_id=$itemId');
    if (response.statusCode == 200 && response.data['status']) {
      final List<ResourceModel> resources = <ResourceModel>[];

      for (var resource in response.data['result']['data']) {
        resources.add(ResourceModel.fromJson(resource));
      }
      return resources;
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
