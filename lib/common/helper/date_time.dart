bool isDateTimeBetween(DateTime? target, DateTime? start, DateTime? end) {
  if (target != null && start != null && end != null) {
    return target.isAfter(start) && target.isBefore(end);
  }
  return true;
}

DateTime? parseDateTime(String? formatTime) {
  if (formatTime != null) {
    return DateTime.parse(formatTime);
  }
  return null;
}
