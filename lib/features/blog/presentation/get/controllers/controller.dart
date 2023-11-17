import 'package:get/get.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/blog/data/models/category_model.dart';
import 'package:khalsha/features/blog/data/models/post_model.dart';
import 'package:khalsha/features/blog/domain/use_cases/get_categories_use_case.dart';
import 'package:khalsha/features/blog/domain/use_cases/get_post_by_cat_id_use_case.dart';

import 'package:khalsha/features/blog/domain/use_cases/blog_search_use_case.dart';

class BlogController extends GetxController {
  final BlogSearchUseCase _blogSearchUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetPostsByCatIdUseCase _getPostsByCatIdUseCase;

  BlogController(
    this._getPostsByCatIdUseCase,
    this._getCategoriesUseCase,
    this._blogSearchUseCase,
  );

  List<CategoryModel> categories = const <CategoryModel>[];
  List<PostModel> posts = const <PostModel>[];

  RxInt selectedCategory = 0.obs;

  RxBool getCategoriesLoading = true.obs, getPostsLoading = true.obs;

  @override
  void onInit() {
    _getCategories();
    super.onInit();
  }

  Future<void> _getCategories() async {
    final params = Params(loading: getCategoriesLoading);

    final result = await _getCategoriesUseCase.execute(params);
    result.fold(
      (_) => _,
      (data) {
        categories = List.from(data);
        selectedCategory(categories.first.id);
        getPostsByCategoryId(categories.first.id.toString());
      },
    );
  }

  Future<void> getPostsByCategoryId(String categoryId) async {
    final params = GetPostsByCatIdUseCaseParams(
      loading: getPostsLoading,
      categoryId: categoryId,
    );

    final result = await _getPostsByCatIdUseCase.execute(params);
    result.fold(
      (_) => _,
      (data) => posts = List.from(data),
    );
  }

  Future<void> blogSearch(String searchText) async {
    final params = BlogSearchUseCaseParams(
      loading: getPostsLoading,
      searchText: searchText,
    );

    final result = await _blogSearchUseCase.execute(params);
    result.fold(
      (_) => _,
      (data) => posts = List.from(data),
    );
  }
}
