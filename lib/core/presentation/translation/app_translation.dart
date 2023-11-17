import 'package:get/get.dart';

import 'package:khalsha/core/presentation/translation/en.dart';
import 'package:khalsha/core/presentation/translation/ar.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
