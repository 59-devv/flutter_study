import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';

// 집
// const host = "http://172.30.1.20:8080";
// 회사
const host = "http://192.168.10.60:8080";

// 통신을 담당하는 것이 Provider의 역할
class PostProvider extends GetConnect {
  Future<Response> findAll() => get(
        "$host/post",
        headers: {"Authorization": jwtToken ?? ""},
      );

  Future<Response> findById(int? id) => get(
        "$host/post/$id",
        headers: {"Authorization": jwtToken ?? ""},
      );
}
