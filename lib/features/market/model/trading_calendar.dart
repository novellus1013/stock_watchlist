class TradingCalendar {
  const TradingCalendar(this.days, {required this.from, required this.to});

  final Set<String> days; // yyyyMMdd
  final String from, to; // 조회 범위

  String get latest => days.reduce((a, b) => a.compareTo(b) > 0 ? a : b);

  /// null = 조회 범위 밖이라 판단 불가
  bool? isTradingDay(String d) {
    if (d.compareTo(from) < 0 || d.compareTo(to) > 0) return null;
    return days.contains(d);
  }
}
