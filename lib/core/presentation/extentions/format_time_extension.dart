import 'package:intl/intl.dart';

const wareHouseDateFormat = 'yyyy-MM-dd hh:mm:ss';

extension FormatDateTime on DateTime {
  String formatDateTime([String? pattern]) =>
      DateFormat(pattern ?? 'yyyy-MM-dd hh:mm a').format(this);
}
