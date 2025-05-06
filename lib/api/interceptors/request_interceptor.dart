import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/constants/storage.dart';

FutureOr<Request> requestInterceptor(request) async {
  // final token = StorageService.box.pull(StorageItems.accessToken);
  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

  var prefs = Get.find<SharedPreferences>();
  var token = prefs.getString(StorageConstants.token);
  var deviceId = prefs.getString(StorageConstants.deviceId);
  request.headers['Authorization'] = 'Bearer $token';
  request.headers['deviceId'] = deviceId;

  // EasyLoading.show(
  //     dismissOnTap: false,
  //     // status: "true",
  //     maskType: EasyLoadingMaskType.black);
  // await Future.delayed(const Duration(seconds: 1));
  // EasyLoading.show(status: 'loading...');
  return request;
}
