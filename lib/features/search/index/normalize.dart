// 검색용 정규화. 공백·&·하이픈·마침표·괄호를 지우고 소문자로 통일한다.
final _strip = RegExp(r'[\s&\-.()]');

String normalize(String s) => s.toLowerCase().replaceAll(_strip, '');
