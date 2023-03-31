import 'package:khalsha/features/otp/data/models/enums/verify_type_model.dart';

enum VerifyType { mobile, email }

extension MapToDomain on VerifyType {
  VerifyTypeModel toDomain() =>
      VerifyTypeModel.values.firstWhere((element) => element.name == name);
}
