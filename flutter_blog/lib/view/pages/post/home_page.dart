import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/view/pages/post/write_page.dart';
import 'package:get/get.dart';

import '../../components/size.dart';
import '../user/login_page.dart';
import '../user/user_info.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController u = Get.find(); // 사용되고 있는 객체 찾기 (싱글톤)
    // UserController u = Get.put(UserController()); // 없으면 만들고, 있으면 있는 것 사용
    return Scaffold(
        drawer: _drawer(context),
        appBar: AppBar(
          title: Obx(
            () => Text("${u.isLogin}"),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  u.isLogin.value = !u.isLogin.value;
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.to(() => DetailPage(id: index),
                    arguments: "agrument 데이터 넘기기");
              },
              title: const Text("ㅁㄴㅇㄹ"),
              leading: const Text("1"),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ));
  }

  Widget _drawer(BuildContext context) {
    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(() => WritePage());
                },
                child: const Text(
                  "글쓰기",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  Get.to(() => UserInfo());
                },
                child: const Text(
                  "회원 정보 보기",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  Get.to(() => LoginPage());
                },
                child: const Text(
                  "로그아웃",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
