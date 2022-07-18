import 'package:flutter/material.dart';
import 'package:flutter_blog/util/validate_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_area.dart';
import '../../components/custom_text_form_field.dart';

class UpdatePage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              CustomTextFormField(
                hint: "Title",
                funValidator: validatorTitle(),
                value: "제목1~~" * 3,
              ),
              CustomTextFormArea(
                hint: "Content",
                funValidator: validatorContent(),
                value: "내용1~~" * 20,
              ),
              CustomElevatedButton(
                text: "수정 완료",
                funPageRoute: () {
                  if (_formkey.currentState!.validate()) {
                    Get.back(); // 원래는 데이터 갱신이 안되겠지만, GetX의 observer를 사용할거라서 갱신 될거임
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
