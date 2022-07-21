import 'package:flutter_blog/controller/dto/CMResponseDto.dart';
import 'package:flutter_blog/controller/dto/LoginRequestDto.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get_connect.dart';

// 통신으로 받은 데이터를 Dart Object로 바꾸는 것이 Repository의 역할
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async {
    LoginRequestDto loginRequestDto = LoginRequestDto(username, password);

    Response response = await _userProvider.login(loginRequestDto.toJson());
    dynamic headers = response.headers;
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body);

    CMResponseDto cmResponseDto = CMResponseDto.fromJson(body);

    if (cmResponseDto.code == 1) {
      User principal = User.fromJson(body);
      String token = headers["authorization"];
      jwtToken = token;

      return principal;
    } else {
      return User();
    }

    // String token = headers["authorization"] ?? "-1";
    // return token;
  }
}
