import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/contact_us/data/data_source/contact_us_remote_data_source.dart';
import 'package:khalsha/features/contact_us/domain/repository/contact_us_repository.dart';

class ContactUsRepositoryImpl extends BaseRepositoryImpl
    implements ContactUsRepository {
  final ContactUsRemoteDataSource _contactUsRemoteDataSource;
  ContactUsRepositoryImpl(this._contactUsRemoteDataSource);

  @override
  Future<Either<Failure, String>> sendMessage({
    required String title,
    required String message,
    required String name,
    required String email,
    required String mobile,
  }) async {
    return request(() async {
      final result = await _contactUsRemoteDataSource.sendMessage(
        title: title,
        message: message,
        name: name,
        email: email,
        mobile: mobile,
      );
      return right(result);
    });
  }
}
