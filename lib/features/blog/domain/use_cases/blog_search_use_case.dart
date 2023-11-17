import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/blog/data/models/post_model.dart';

import 'package:khalsha/features/blog/domain/repo/blog_repository.dart';

class BlogSearchUseCase
    extends UseCase<List<PostModel>, BlogSearchUseCaseParams> {
  final BlogRepository _blogRepository;
  BlogSearchUseCase(this._blogRepository);

  @override
  Future<Either<Failure, List<PostModel>>> execute(
      BlogSearchUseCaseParams params) async {
    params.loading(true);
    final call = _blogRepository.blogSearch(params.searchText);
    call.then((_) => params.loading(false));
    return call;
  }
}

class BlogSearchUseCaseParams extends Params {
  final String searchText;

  BlogSearchUseCaseParams({
    required super.loading,
    required this.searchText,
  });
}
