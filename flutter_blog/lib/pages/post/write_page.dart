import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_text_area.dart';
import 'package:flutter_blog/components/custom_text_form_field.dart';
import 'package:flutter_blog/pages/post/home_page.dart';
import 'package:flutter_blog/util/validate_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';

class WritePage extends StatelessWidget {
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
              ),
              CustomTextFormArea(
                hint: "Content",
                funValidator: validatorContent(),
              ),
              CustomElevatedButton(
                text: "글쓰기",
                funPageRoute: () {
                  if (_formkey.currentState!.validate()) {
                    Get.to(const HomePage());
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
