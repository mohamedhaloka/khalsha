import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/repository/base_repository.dart';
import 'package:khalsha/core/domain/utils/constants.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';
import 'package:khalsha/features/auth/presentation/get/controllers/auth_controller.dart';

class BaseRepositoryImpl implements BaseRepository {
  @override
  Future<Either<Failure, T>> request<T>(
      FutureEitherFailureOrData<T> body) async {
    final authController = Get.find<AuthController>();
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      authController.changeStatus(AuthStatus.none);

      return await body();
    } catch (e) {
      if (e is DioException) {
        var errorCode = ServerErrorCode.serverError;

        if (e.response != null) {
          errorCode = _getErrorCode(e.response!.statusCode ?? 500);

          if (errorCode == ServerErrorCode.unauthenticated ||
              errorCode == ServerErrorCode.accessTokenExpired) {
            if (Get.isRegistered<AuthController>()) {
              authController.authStatus(AuthStatus.unAuthorized);
            }
          } else if (errorCode == ServerErrorCode.forbidden) {
            if (e.response!.data is Map &&
                (e.response!.data as Map).containsKey('type')) {
              final type = e.response!.data['type'];
              if (type == 'need_verify_mobile') {
                authController.authStatus(AuthStatus.verifyPhone);
              } else if (type == 'need_verify_email') {
                authController.authStatus(AuthStatus.verifyEmail);
              }
            }
          }
        }
        return left(ServerFailure(
          errorCode: errorCode,
          message: e.response!.getErrorMessage(),
        ));
      }

      if (e is ServerException) {
        return left(ServerFailure(
          errorCode: ServerErrorCode.serverError,
          message: e.errorMessage,
        ));
      }

      return left(const ServerFailure(errorCode: ServerErrorCode.serverError));
    }
  }

  ServerErrorCode _getErrorCode(int statusCode) {
    switch (statusCode) {
      case 401:
        return ServerErrorCode.unauthenticated;
      case 404:
      case 477:
        return ServerErrorCode.notFound;
      case 403:
        return ServerErrorCode.forbidden;
      case 400:
        return ServerErrorCode.invalidData;
      case 422:
        return ServerErrorCode.wrongInput;
      default:
        return ServerErrorCode.serverError;
    }
  }
}
