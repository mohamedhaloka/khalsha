import 'package:khalsha/features/otp/domain/entites/enums/verify_type.dart';

enum VerifyTypeModel { mobile, email }

extension MapToDomain on VerifyTypeModel {
  VerifyType toDomain() =>
      VerifyType.values.firstWhere((element) => element.name == name);
}
