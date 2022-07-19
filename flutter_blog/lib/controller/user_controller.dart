import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수 => 변경되면 UI 자동 업데이트 됨

  Future<String> login(String username, String password) async {
    String token = await _userRepository.login(username, password);

    if (token != "-1") {
      isLogin.value = true; // RX 타입은 value로 접근해서 값을 바꿔주어야 한다.
      jwtToken = token;
    }

    print("jwtToken : $jwtToken");
    return token;
  }
}
