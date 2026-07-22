num? parseNum(Object? raw) {
  if (raw is num) return raw;
  if (raw is! String) return null;

  final s = raw.trim();
  if (s.isEmpty || s == '-') return null;

  return num.tryParse(s);
}

int parseInt(Object? raw, {int fallback = 0}) =>
    parseNum(raw)?.toInt() ?? fallback;

double parseDouble(Object? raw, {double fallback = 0}) =>
    parseNum(raw)?.toDouble() ?? fallback;
