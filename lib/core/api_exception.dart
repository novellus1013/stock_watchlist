class StockApiException implements Exception {
  const StockApiException(this.message, {this.code});

  final String message;
  final String? code; // 공공데이터포털 resultCode

  // 서버가 코드로 명시 거부한 경우는 다시 요청해도 결과가 동일
  bool get retryable => code == null;

  String get userMessage => switch (code) {
    '22' => 'API 일일 호출 한도를 초과했습니다.',
    '20' || '30' || '31' => 'API 인증키를 확인해 주세요.',
    _ => '데이터를 불러오지 못했습니다. 잠시 후 다시 시도해 주세요.',
  };

  @override
  String toString() => 'StockApiException(${code ?? '-'}): $message';
}
