import 'package:get/get.dart';

const host = "http://172.30.1.20:8080";

// 통신을 담당하는 것이 Provider의 역할
class UserProvider extends GetConnect {
  Future<Response> login(Map data) => post("$host/login", data);
}
