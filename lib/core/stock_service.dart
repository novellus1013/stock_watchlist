import 'package:dio/dio.dart';
import 'api_exception.dart';
import 'env.dart';

Dio buildDio() => Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 30), // 실측 최대 16.3초
    receiveTimeout: const Duration(seconds: 30),
    validateStatus: (_) => true, // 401 본문을 직접 판별
  ),
);

class StockService {
  StockService(this._dio);
  final Dio _dio;

  static const _url =
      'https://apis.data.go.kr/1160100/service/GetStockSecuritiesInfoService/getStockPriceInfo';

  Future<List<Map<String, dynamic>>> getStockPrices({
    String? basDt,
    String? beginBasDt,
    String? endBasDt, // 미만. 포함하려면 +1일
    String? likeSrtnCd,
    int numOfRows = 10000,
    CancelToken? cancelToken,
  }) async {
    final res = await _dio.get<dynamic>(
      _url,
      queryParameters: {
        'serviceKey': Env.serviceKey,
        'resultType': 'json', // 기본값이 xml
        'numOfRows': numOfRows,
        'pageNo': 1,
        'basDt': ?basDt,
        'beginBasDt': ?beginBasDt,
        'endBasDt': ?endBasDt,
        'likeSrtnCd': ?likeSrtnCd,
      },
      cancelToken: cancelToken,
    );

    final data = res.data;

    // JSON이 아니면 XML 에러 or Unauthorized
    if (data is! Map) {
      final body = '$data'.trim();
      final code = RegExp(
        r'<returnReasonCode>(\d+)<',
      ).firstMatch(body)?.group(1);
      throw StockApiException(body, code: code ?? '-'); // '-' → 재시도 안 함
    }

    final header = data['response']?['header'];
    if (header?['resultCode'] != '00') {
      throw StockApiException(
        header?['resultMsg'] as String? ?? '오류',
        code: header?['resultCode'] as String?,
      );
    }

    // 휴장일에는 item이 empty. error 아님
    final item = data['response']?['body']?['items']?['item'];
    return item is List ? item.cast<Map<String, dynamic>>() : const [];
  }
}
