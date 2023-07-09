import 'package:intl/intl.dart';

const wareHouseDateFormat = 'yyyy-MM-dd hh:mm:ss';

extension FormatDateTime on DateTime {
  String formatTime(String? pattern) =>
      DateFormat(pattern ?? 'yyyy-MM-dd hh:mm').format(this);
}
