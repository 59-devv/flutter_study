import 'package:flutter/material.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            _loginForm()
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      child: Column(
        children: const [
          CustomTextFormField(hint: "Username"),
          CustomTextFormField(hint: "Password"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CustomElevatedButton(text: "로그인"),
          ),
        ],
      ),
    );
  }
}
