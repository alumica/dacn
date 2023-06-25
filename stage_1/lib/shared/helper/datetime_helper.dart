import 'package:intl/intl.dart';

class DateTimeHelper {
  static String getDate(DateTime dateTime, {String format = "dd - MM"}) {
    return DateFormat(format).format(dateTime);
  }
}
