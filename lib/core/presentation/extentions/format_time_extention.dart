import 'package:intl/intl.dart';

const wareHouseDateFormat = 'yyyy-MM-dd hh:mm:ss';

extension FormatDateTime on DateTime {
  String formatTime(String pattern) =>
      DateFormat('yyyy-MM-dd hh:mm').format(this);
}
