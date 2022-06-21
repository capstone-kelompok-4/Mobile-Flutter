class DataConverter {
  static Duration convertDuration(String duration) {
    String parseTimeDuration =
        "${duration.substring(0, 2)}h${duration.substring(2, 5)}m${duration.substring(5, 8)}s";
    Duration newDuration = parseDuration(parseTimeDuration, separator: ':');
    return newDuration;
  }

  static Duration parseDuration(String input, {String separator = ':'}) {
    final parts = input.split(separator).map((t) => t.trim()).toList();

    int? weeks;
    int? days;
    int? hours;
    int? minutes;
    int? seconds;
    int? milliseconds;
    int? microseconds;

    for (String part in parts) {
      final match = RegExp(r'^(\d+)(w|d|h|min|m|s|ms|us)$').matchAsPrefix(part);
      if (match == null) throw const FormatException('Invalid duration format');

      int value = int.parse(match.group(1)!);
      String? unit = match.group(2);

      switch (unit) {
        case 'w':
          if (weeks != null) {
            throw const FormatException('Weeks specified multiple times');
          }
          weeks = value;
          break;
        case 'd':
          if (days != null) {
            throw const FormatException('Days specified multiple times');
          }
          days = value;
          break;
        case 'h':
          if (hours != null) {
            throw const FormatException('Days specified multiple times');
          }
          hours = value;
          break;
        case 'min':
        case 'm':
          if (minutes != null) {
            throw const FormatException('Days specified multiple times');
          }
          minutes = value;
          break;
        case 's':
          if (seconds != null) {
            throw const FormatException('Days specified multiple times');
          }
          seconds = value;
          break;
        case 'ms':
          if (milliseconds != null) {
            throw const FormatException('Days specified multiple times');
          }
          milliseconds = value;
          break;
        case 'us':
          if (microseconds != null) {
            throw const FormatException('Days specified multiple times');
          }
          microseconds = value;
          break;
        default:
          throw FormatException('Invalid duration unit $unit');
      }
    }

    return Duration(
        days: (days ?? 0) + (weeks ?? 0) * 7,
        hours: hours ?? 0,
        minutes: minutes ?? 0,
        seconds: seconds ?? 0,
        milliseconds: milliseconds ?? 0,
        microseconds: microseconds ?? 0);
  }
}
