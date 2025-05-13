import 'package:flutter_getx_boilerplate_code/api/api.dart';
import 'package:flutter_getx_boilerplate_code/models/post_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;

  HomeController({required this.apiRepository});

  var posts = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllPosts();
  }

  fetchAllPosts() async {
    try {
      final res = await apiRepository.getPosts();
      if (res.isNotEmpty) {
        posts.assignAll(res);
      } else {
        Get.snackbar('Error', 'No posts found');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  fetchPostById(int id) async {
    try {
      final res = await apiRepository.getPostById(id);
      if (res != null) {
        Get.snackbar('Post', 'Post fetched successfully');
      } else {
        Get.snackbar('Error', 'Post not found');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  createPost(Map<String, dynamic> data) async {
    try {
      final res = await apiRepository.createPost(data);
      if (res) {
        Get.snackbar('Success', 'Post created successfully');
        fetchAllPosts();
      } else {
        Get.snackbar('Error', 'Failed to create post');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  updatePost(int id, Map<String, dynamic> data) async {
    try {
      final res = await apiRepository.updatePost(id, data);
      if (res) {
        Get.snackbar('Success', 'Post updated successfully');
        fetchAllPosts();
      } else {
        Get.snackbar('Error', 'Failed to update post');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  deletePost(int id) async {
    try {
      final res = await apiRepository.deletePost(id);
      if (res) {
        Get.snackbar('Success', 'Post deleted successfully');
        fetchAllPosts();
      } else {
        Get.snackbar('Error', 'Failed to delete post');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
