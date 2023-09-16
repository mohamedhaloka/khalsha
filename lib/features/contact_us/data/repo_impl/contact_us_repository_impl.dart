import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/features/contact_us/data/data_source/contact_us_remote_data_source.dart';
import 'package:khalsha/features/contact_us/domain/repository/contact_us_repository.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../../../core/domain/error/failures.dart';

class ContactUsRepositoryImpl extends ContactUsRepository {
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
    try {
      final result = await _contactUsRemoteDataSource.sendMessage(
        title: title,
        message: message,
        name: name,
        email: email,
        mobile: mobile,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.data.toString()));
    }
  }
}
