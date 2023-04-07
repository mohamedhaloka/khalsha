import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/settlement/data/data_source/settlement_remote_data_source.dart';
import 'package:khalsha/features/settlement/data/models/settlement.dart';
import 'package:khalsha/features/settlement/domain/repo/settlement_repository.dart';

import '../../../../core/domain/error/exceptions.dart';

class SettlementRepositoryImpl extends SettlementRepository {
  final SettlementRemoteDataSource _settlementRemoteDataSource;
  SettlementRepositoryImpl(this._settlementRemoteDataSource);

  @override
  Future<Either<Failure, List<SettlementModel>>> getSettlements() async {
    try {
      final result = await _settlementRemoteDataSource.getSettlements();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.data.toString()));
    }
  }
}
