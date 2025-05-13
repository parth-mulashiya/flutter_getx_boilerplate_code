import 'package:flutter_getx_boilerplate_code/models/post_model.dart';

import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<PostModel>> getPosts() async {
    final res = await apiProvider.getMethod(ApiConstants.postApi);

    if (res.statusCode == 200) {
      return (res.body as List)
          .map((tagJson) => PostModel.fromJson(tagJson))
          .toList();
    }
    return [];
  }

  Future<PostModel?> getPostById(int id) async {
    final res = await apiProvider.getMethod('${ApiConstants.postApi}/$id');

    if (res.statusCode == 200) {
      return PostModel.fromJson(res.body);
    }
    return null;
  }

  Future<bool> createPost(Map<String, dynamic> data) async {
    final res = await apiProvider.postMethod(ApiConstants.postApi, data);

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<bool> updatePost(int id, Map<String, dynamic> data) async {
    final res = await apiProvider.putMethod(
      '${ApiConstants.postApi}/$id',
      data,
    );

    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> deletePost(int id) async {
    final res = await apiProvider.deleteMethod('${ApiConstants.postApi}/$id');

    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }
}
