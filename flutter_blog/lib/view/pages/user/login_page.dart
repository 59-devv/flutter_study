import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/util/validate_util.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import 'join_page.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "로그인 화면 ${u.isLogin}",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _loginForm(),
            TextButton(
              onPressed: () {
                Get.to(JoinPage());
              },
              child: const Text("회원가입 하러 가기"),
            )
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "Username",
            funValidator: validatorUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatorPassword(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CustomElevatedButton(
              text: "로그인",
              funPageRoute: () async {
                if (_formkey.currentState!.validate()) {
                  // Get.to(const HomePage());
                  int result = await u.login(
                      _username.text.trim(), _password.text.trim());

                  if (result == 1) {
                    Get.to(() => const HomePage());
                  } else {
                    Get.snackbar("WAGGLY", "아이디, 비밀번호를 확인하세요.");
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
