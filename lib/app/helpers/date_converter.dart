import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(dateTime) =>
      DateFormat('dd MMMM yyyy').format(dateTime);
}
