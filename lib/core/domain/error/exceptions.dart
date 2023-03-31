class ServerException implements Exception {
  final String? errorMessage;
  const ServerException({this.errorMessage});
}

class PasswordsWrongException implements Exception {
  const PasswordsWrongException();
}

class DuplicationUserException implements Exception {
  const DuplicationUserException();
}

class UserNotExistException implements Exception {
  const UserNotExistException();
}

class PermissionLocationException implements Exception {
  const PermissionLocationException();
}

class NoPlacesFoundException implements Exception {
  const NoPlacesFoundException();
}

class NoFilePathException implements Exception {
  const NoFilePathException();
}
