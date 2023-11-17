import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/contact_us/domain/repository/contact_us_repository.dart';

class SendMessageContactUsUseCase
    extends UseCase<String, SendMessageContactUsParams> {
  final ContactUsRepository _contactUsRepository;
  SendMessageContactUsUseCase(this._contactUsRepository);

  @override
  Future<Either<Failure, String>> execute(
      SendMessageContactUsParams params) async {
    params.loading(true);
    final call = _contactUsRepository.sendMessage(
        title: params.title,
        message: params.message,
        name: params.name,
        email: params.email,
        mobile: params.mobile);
    call.then((_) => params.loading(false));
    return call;
  }
}

class SendMessageContactUsParams extends Params {
  final String title;
  final String name;
  final String email;
  final String message;
  final String mobile;
  SendMessageContactUsParams({
    required super.loading,
    required this.email,
    required this.mobile,
    required this.name,
    required this.message,
    required this.title,
  });
}
