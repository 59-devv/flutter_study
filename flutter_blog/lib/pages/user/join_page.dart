import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/user/login_page.dart';
import 'package:flutter_blog/util/validate_util.dart';
import 'package:get/route_manager.dart';
import 'package:validators/validators.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';

class JoinPage extends StatelessWidget {
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
                "회원가입 화면",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _joinForm()
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
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
          CustomTextFormField(
            hint: "Email",
            funValidator: validatorEmail(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CustomElevatedButton(
              text: "회원가입",
              funPageRoute: () {
                if (_formkey.currentState!.validate()) {
                  Get.to(LoginPage());
                }
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Get.to(LoginPage());
            },
            child: const Text("로그인 페이지로 이동"),
          )
        ],
      ),
    );
  }
}
