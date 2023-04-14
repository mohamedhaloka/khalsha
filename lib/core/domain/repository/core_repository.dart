import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

import '../../data/models/data_model.dart';
import '../../data/models/profile_data_model.dart';

abstract class CoreRepository {
  Future<Either<Failure, ProfileDataModel>> getProfile();

  Future<Either<Failure, String>> updateProfile(
    String name,
    String email,
    String mobile,
    String bio,
    String commercialCertificate,
  );

  Future<Either<Failure, String>> updateProfilePhoto(String photoPath);

  Future<Either<Failure, List<DataModel>>> getParticularEnvData(
    String pageName,
  );

  Future<Either<Failure, String>> uploadImage({
    required String pageName,
    required String orderId,
    required String path,
    required String field,
    required String filePath,
  });

  Future<Either<Failure, String>> deleteFile(String pageName,
      {required int id});

  Future<Either<Failure, String>> downloadFile(String url);
}
