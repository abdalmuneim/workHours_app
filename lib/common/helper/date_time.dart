import 'package:intl/intl.dart';

bool isDateTimeBetween(DateTime? target, DateTime? start, DateTime? end) {
  if (target != null && start != null && end != null) {
    return target.isAfter(start) && target.isBefore(end);
  }
  return true;
}

DateTime? parseDateTime(String? formatTime) {
  if (formatTime != null) {
    return DateFormat().add_yMEd().parse(formatTime);
  }
  return null;
}
