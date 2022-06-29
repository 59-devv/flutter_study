import 'package:flutter/material.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({Key? key}) : super(key: key);

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
      child: Column(
        children: const [
          CustomTextFormField(hint: "Username"),
          CustomTextFormField(hint: "Password"),
          CustomTextFormField(hint: "Email"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CustomElevatedButton(text: "회원가입"),
          ),
        ],
      ),
    );
  }
}
