import 'package:equatable/equatable.dart';
import 'package:khalsha/core/domain/utils/constants.dart';

class Failure extends Equatable {
  final int? statusCode;
  final String? statusMessage;
  const Failure({this.statusCode, this.statusMessage});

  @override
  List<Object?> get props => [statusCode, statusMessage];
}

class NoFilePathFailure extends Failure {
  const NoFilePathFailure() : super(statusMessage: '', statusCode: 500);
}

class NoPlacesFoundFailure extends Failure {
  const NoPlacesFoundFailure()
      : super(statusMessage: 'no-places-found', statusCode: 500);
}

class ServiceNotAvailableForThisLocationFailure extends Failure {
  final String placeName;
  const ServiceNotAvailableForThisLocationFailure(this.placeName)
      : super(
            statusMessage: 'service-not-viable-for-this-place',
            statusCode: 500);
}

class PermissionLocationFailure extends Failure {
  const PermissionLocationFailure()
      : super(statusMessage: 'location-permission-required', statusCode: 500);
}

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure({super.statusMessage}) : super(statusCode: 500);
}

class ServerFailure extends Failure {
  final ServerErrorCode errorCode;
  final String? message;

  const ServerFailure({required this.errorCode, this.message})
      : super(statusCode: 500, statusMessage: message);
}

class PasswordsWrongFailure extends Failure {
  const PasswordsWrongFailure({super.statusMessage = 'passwords-wrong'})
      : super(statusCode: 200);
}

class UserNotExistFailure extends Failure {
  const UserNotExistFailure()
      : super(
            statusCode: 200,
            statusMessage: 'no-user-found-with-this-conditionals');
}

class DuplicationUserFailure extends Failure {
  const DuplicationUserFailure()
      : super(
            statusCode: 200,
            statusMessage: 'user-exist-with-same-conditionals');
}
