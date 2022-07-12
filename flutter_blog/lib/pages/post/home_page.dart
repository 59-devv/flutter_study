import 'package:flutter/material.dart';
import 'package:flutter_blog/components/size.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      appBar: AppBar(),
      body: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){},
              title: const Text("ㅁㄴㅇㄹ"),
            );
          },
        separatorBuilder: (context, index) {
            return const Divider();
        },
          )
    );
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
                  onPressed: (){ },
                  child: const Text(
                      "회원 정보 보기",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold
                      ),
                  ),
              ),
              const Divider(),
              TextButton(
                onPressed: (){ },
                child: const Text(
                  "로그아웃",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold
                  ),
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
