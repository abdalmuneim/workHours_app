import 'package:intl/intl.dart';

bool isDateTimeBetween(DateTime? target, String? start, String? end) {
  if (target != null && start != null && end != null) {
    if (target == parseDateTime(start)) {
      return false;
    } else {
      return target.isAfter(parseDateTime(start)!) &&
          target.isBefore(parseDateTime(end)!);
    }
  }
  return true;
}

DateTime? parseDateTime(String? formatTime) {
  if (formatTime != null) {
    return DateFormat().add_yMEd().parse(formatTime);
  }
  return null;
}
