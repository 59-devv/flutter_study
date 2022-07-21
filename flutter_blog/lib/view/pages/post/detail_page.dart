import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final int? id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    UserController u = Get.find();
    PostController p = Get.find();
    // String data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 아이디 : $id, 로그인 상태 : ${u.isLogin}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${p.post.value.title}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const Divider(),
              u.principal.value.id == p.post.value.user?.id
                  ? Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => UpdatePage());
                          },
                          child: const Text("수정"),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () async {
                            await p.deleteById(p.post.value.id);
                            Get.to(() => const HomePage());
                            // Get.back();
                          },
                          child: const Text("삭제"),
                        ),
                      ],
                    )
                  : const SizedBox(),
              Expanded(
                child: SingleChildScrollView(
                  child: Text("${p.post.value.content}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
