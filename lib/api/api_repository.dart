import 'dart:developer';

import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  // Future<UserModel?> login(UserModel data) async {
  //   final res = await apiProvider.postMethod(
  //       ApiConstants.loginApi, data.getLoginParams());
  //   if (res.statusCode == 200) {
  //     return UserModel.fromJsonForLogin(res.body["responseData"]);
  //   } else if (res.status.isNotFound) {
  //     CommonWidget.toast(res.statusText ?? "");
  //     // EasyLoading.dismiss();
  //   }
  //   return null;
  // }

  Future<String?> checkLastSyncData(String type) async {
    final res = await apiProvider.getMethod(type);
    log("Status Code----${res.status.code}, type : $type");
    if (res.statusCode == 200) {
      return (res.body["responseData"]['lastSyncedAt']) ?? "0";
    }
    return null;
  }

  // Future<List<ServicesModel>> getServicesApi() async {
  //   final res = await apiProvider.getMethod(ApiConstants.servicesApi);

  //   if (res.statusCode == 200) {
  //     return (res.body["data"]["list"] as List)
  //         .map((tagJson) => ServicesModel.fromJson(tagJson))
  //         .toList();
  //   }
  //   return [];
  // }
}
