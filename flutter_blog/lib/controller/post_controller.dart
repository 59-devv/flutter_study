import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';

import '../domain/post/post.dart';

class PostController extends GetxController {
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<void> findAll() async {
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts;
  }

  Future<void> findById(int? id) async {
    Post post = await _postRepository.findById(id);
    this.post.value = post;
  }

  Future<void> deleteById(int? id) async {
    int result = await _postRepository.deleteById(id);
    if (result == 1) {
      posts.value = posts.where((post) => post.id != id).toList();
    }
  }
}
