import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/post/home_page.dart';
import 'package:flutter_blog/pages/user/join_page.dart';
import 'package:flutter_blog/util/validate_util.dart';
import 'package:get/route_manager.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

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
              child: const Text(
                "로그인 화면",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
            hint: "Username",
            funValidator: validatorUsername(),
          ),
          CustomTextFormField(
            hint: "Password",
            funValidator: validatorPassword(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CustomElevatedButton(
              text: "로그인",
              funPageRoute: () {
                if (_formkey.currentState!.validate()) {
                  Get.to(const HomePage());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
