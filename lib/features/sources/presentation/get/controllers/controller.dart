import 'package:get/get.dart';
import 'package:khalsha/features/sources/data/models/resource_model.dart';
import 'package:khalsha/features/sources/domain/use_cases/get_resource_details_use_case.dart';
import 'package:khalsha/features/sources/domain/use_cases/get_resources_use_case.dart';

import '../../../../../core/domain/use_cases/use_case.dart';
import '../../../../blog/data/models/category_model.dart';

class SourcesController extends GetxController {
  final GetResourcesUseCase _getResourcesUseCase;
  final GetResourceDetailsUseCase _getResourceDetailsUseCase;

  SourcesController(
    this._getResourcesUseCase,
    this._getResourceDetailsUseCase,
  );

  List<CategoryModel> categories = <CategoryModel>[];
  List<ResourceModel> resources = <ResourceModel>[];

  RxBool getCategoriesLoading = true.obs, getResourcesLoading = true.obs;

  @override
  void onInit() {
    _getCategories();
    super.onInit();
  }

  Future<void> _getCategories() async {
    final params = Params(loading: getCategoriesLoading);

    final result = await _getResourcesUseCase.execute(params);
    result.fold(
      (_) => _,
      (data) => categories = List.from(data),
    );
  }

  Future<void> getResourcesByCategoryId(String itemId) async {
    resources.clear();
    final params = GetResourceDetailsUseCaseParams(
      loading: getResourcesLoading,
      itemId: itemId,
    );

    final result = await _getResourceDetailsUseCase.execute(params);
    result.fold(
      (_) => _,
      (data) => resources = List.from(data),
    );
  }
}
