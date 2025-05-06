import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/response/error_response.dart';
import '../../routes/routes.dart';
import '../../shared/constants/constants.dart';
import '../../shared/utils/utils.dart';

FutureOr<dynamic> responseInterceptor(
  Request request,
  Response response,
) async {
  EasyLoading.dismiss();
  // ignore: deprecated_member_use
  if (response.status.isNull) {
    handleErrorStatus(response);
    return response;
  }
  if (response.statusCode != 200) {
    handleErrorStatus(response);
    return response;
  }

  return response;
}

void handleErrorStatus(Response response) {
  print(".....");
  print(response.request!.url.toString());
  print(response.statusCode.toString());
  print(response.body.toString());
  switch (response.statusCode) {
    case 400:
      final message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(message.message);
      break;
    case 401:
      // final message = ErrorResponse.fromJson(response.body);
      // CommonWidget.toast(message.message);
      if (Get.currentRoute != Routes.LOGIN) {
        final prefs = Get.find<SharedPreferences>();
        prefs.remove(StorageConstants.token);
        Get.offAllNamed(Routes.LOGIN);
      }
      break;
    case 403:
    case 422:
      final message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(message.message);
      break;
    case 409: //conflict
      // final message = ErrorResponse.fromJson(response.body);
      // CommonWidget.toast(message.message);
      // Get.showSnackbar(
      //   GetBar(
      //     title: "GetBar Demo",
      //     message: "This is a ",
      //     isDismissible: true,
      //   ),
      // );
      break;
    case 503:
      //maintainance
      // print("currrent Route maintenance---" + Get.currentRoute);
      // if (Get.currentRoute != Routes.MAINTAINANCE) {
      //   final message = ErrorResponse.fromJson(response.body);
      //   Get.offAllNamed(Routes.MAINTAINANCE, arguments: message.message);
      // }
      break;
    case 404:
      // CommonWidget.toast("Not Found");
      break;
    default:
      CommonWidget.toast(response.statusText.toString());
      break;
  }

  return;
}
