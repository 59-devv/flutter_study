import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/post/home_page.dart';
import 'package:flutter_blog/pages/post/update_page.dart';
import 'package:get/route_manager.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    // String data = Get.arguments;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "글 제목!!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const Divider(),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(UpdatePage());
                    },
                    child: const Text("수정"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(const HomePage());
                      // Get.back();
                    },
                    child: const Text("삭제"),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text("글 내용!!" * 500),
                ),
              ),
            ],
          ),
        ));
  }
}
