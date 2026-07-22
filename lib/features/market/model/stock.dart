import 'package:freezed_annotation/freezed_annotation.dart';
part 'stock.freezed.dart';

enum Market {
  kospi('KOSPI', '코스피'),
  kosdaq('KOSDAQ', '코스닥'),
  konex('KONEX', '코넥스');

  const Market(this.code, this.label);
  final String code;
  final String label;

  static Market? from(Object? raw) =>
      values.where((m) => m.code == raw).firstOrNull;
}

@freezed
abstract class Stock with _$Stock {
  //데이터 클래스는 abstract
  const factory Stock({
    required String code, // srtnCd (6자리)
    required String name, // itmsNm
    Market? market, // mrktCtg
  }) = _Stock;

  factory Stock.fromRow(Map<String, dynamic> r) => Stock(
    code: r['srtnCd'] as String,
    name: r['itmsNm'] as String,
    market: Market.from(r['mrktCtg']),
  );
}
