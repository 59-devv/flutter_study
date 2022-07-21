import 'package:flutter_blog/controller/dto/CMResponseDto.dart';
import 'package:flutter_blog/controller/dto/LoginRequestDto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get_connect.dart';

// 통신으로 받은 데이터를 Dart Object로 바꾸는 것이 Repository의 역할
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body);

    CMResponseDto cmResponseDto = CMResponseDto.fromJson(body);
    // print(cmResponseDto.code);
    // print(cmResponseDto.msg);
    // print(cmResponseDto.data);

    if (cmResponseDto.code == 1) {
      List<dynamic> tmp = cmResponseDto.data;
      List<Post> posts = tmp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[];
    }
  }

  Future<Post> findById(int? id) async {
    Response response = await _postProvider.findById(id);
    dynamic body = await response.body;
    CMResponseDto cmResponseDto = CMResponseDto.fromJson(body);

    if (cmResponseDto.code == 1) {
      Post post = Post.fromJson(cmResponseDto.data);
      return post;
    } else {
      return Post();
    }
  }
}
