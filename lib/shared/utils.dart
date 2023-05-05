import 'dart:io';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Utils {
  static String convertDateTime(String date, String time) {
    initializeDateFormatting(Platform.localeName, null);
    DateTime raceDate = DateTime.parse('${date}T$time');
    DateTime localDate = raceDate.toLocal();

    String formattedDate =
        DateFormat('dd MMM HH:mm', Platform.localeName).format(localDate);

    return formattedDate.toUpperCase();
  }
}
