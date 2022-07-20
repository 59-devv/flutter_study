import 'package:intl/intl.dart';

class CMResponseDto {
  final int? code;
  final String? msg;
  final dynamic data;

  CMResponseDto({
    this.code,
    this.msg,
    this.data,
  });

  CMResponseDto.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}
