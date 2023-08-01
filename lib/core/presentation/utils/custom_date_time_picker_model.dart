import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CustomDateTimePickerModel extends DateTimePickerModel {
  CustomDateTimePickerModel(
      {DateTime? currentTime,
      DateTime? maxTime,
      DateTime? minTime,
      LocaleType? locale})
      : super(
          currentTime: currentTime,
          maxTime: maxTime,
          minTime: minTime,
          locale: locale,
        );

  @override
  List<int> layoutProportions() {
    return [4, 1, 0];
  }

  @override
  String rightDivider() {
    return '';
  }
}
