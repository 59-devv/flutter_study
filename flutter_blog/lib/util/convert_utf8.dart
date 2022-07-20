import 'dart:convert';

dynamic convertUtf8ToObject(dynamic body) {
  String responseBody = jsonEncode(body); // JSON 데이터로 변경
  dynamic convertBody =
      jsonDecode(utf8.decode(responseBody.codeUnits)); // UTF8 형식으로 변경
  return convertBody;
}
