import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/blog/data/models/post_model.dart';

import '../repo/blog_repository.dart';

class GetPostsByCatIdUseCase
    extends UseCase<List<PostModel>, GetPostsByCatIdUseCaseParams> {
  final BlogRepository _blogRepository;
  GetPostsByCatIdUseCase(this._blogRepository);

  @override
  Future<Either<Failure, List<PostModel>>> execute(
      GetPostsByCatIdUseCaseParams params) async {
    params.loading(true);
    final call = _blogRepository.getBlogByCategory(params.categoryId);
    call.then((_) => params.loading(false));
    return call;
  }
}

class GetPostsByCatIdUseCaseParams extends Params {
  final String categoryId;

  GetPostsByCatIdUseCaseParams({
    required super.loading,
    required this.categoryId,
  });
}
