import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import '../shared/constants/strings.dart';
import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  Future<Response> uploadFile(
      String path, String keyName, File file, {String? campaignId}) {
    return post(
      path,
      FormData({
        keyName: MultipartFile(file,
            filename: "profile.csv", contentType: "text/csv"),
        "campaignId": campaignId
      }),
      headers: {
        "Connection": "keep-alive",
      },
    );
  }

  Future<Response> generateQR(String path) {
    return post(path, null);
  }

  Future<Response> getMethod(String path, {Map<String, dynamic>? query}) {
    // return get(path);
    return get(path, query: query).then(
      (value) {
        if (value.statusCode == null) {
          EasyLoading.dismiss();
          var status = value.statusText;
          if (value.statusText!.contains("errno = 7")) {
            if (value.request!.url.toString().contains("auth")) {
              // Get.to(() => const NoInternetScreen());
              if (Get.currentRoute != Routes.NONETWORK) {
                Get.toNamed(Routes.NONETWORK);
              }
            }
          } else {
            if (value.statusText!.contains("timed out") ||
                value.statusText!.contains("TimeoutException")) {
              status = Strings.connectionTimeout;
            }
            EasyLoading.show(
              status: status,
              indicator: const Icon(
                Icons.info_rounded,
                color: Colors.red,
                size: 64,
              ),
              dismissOnTap: true,
              // duration: const Duration(seconds: 5),
              maskType: EasyLoadingMaskType.black,
            );
          }
        }
        return value;
      },
    );
  }

  Future<Response> postMethod(String path, Map<String, dynamic>? data) {
    return post(path, data).then(
      (value) {
        if (value.statusCode == null) {
          EasyLoading.dismiss();
          var status = value.statusText;
          log(status.toString());
          if (value.statusText!.contains("errno = 7")) {
            if (value.request!.url.toString().contains("auth")) {
              // Get.to(() => const NoInternetScreen());
              if (Get.currentRoute != Routes.NONETWORK) {
                Get.toNamed(Routes.NONETWORK);
              }
            }
          } else {
            if (value.statusText!.contains("timed out") ||
                value.statusText!.contains("TimeoutException")) {
              status = Strings.connectionTimeout;
            }
            EasyLoading.show(
              status: status,
              indicator: const Icon(
                Icons.info_rounded,
                color: Colors.red,
                size: 64,
              ),
              dismissOnTap: true,
              // duration: const Duration(seconds: 5),
              maskType: EasyLoadingMaskType.black,
            );
          }
        }
        return value;
      },
    );
  }

  Future<Response> putMethod(String path, Map<String, dynamic>? data) {
    return put(path, data).then(
      (value) {
        if (value.statusCode == null) {
          EasyLoading.dismiss();
          var status = value.statusText;
          log(status.toString());
          if (value.statusText!.contains("errno = 7")) {
            if (value.request!.url.toString().contains("auth")) {
              // Get.to(() => const NoInternetScreen());
              if (Get.currentRoute != Routes.NONETWORK) {
                Get.toNamed(Routes.NONETWORK);
              }
            }
          } else {
            if (value.statusText!.contains("timed out") ||
                value.statusText!.contains("TimeoutException")) {
              status = Strings.connectionTimeout;
            }
            EasyLoading.show(
              status: status,
              indicator: const Icon(
                Icons.info_rounded,
                color: Colors.red,
                size: 64,
              ),
              dismissOnTap: true,
              // duration: const Duration(seconds: 5),
              maskType: EasyLoadingMaskType.black,
            );
          }
        }
        return value;
      },
    );
  }

  Future<Response> postMethodList(String path, dynamic data) {
    return post(path, data).then(
      (value) {
        if (value.statusCode == null) {
          EasyLoading.dismiss();
          var status = value.statusText;
          if (value.statusText!.contains("errno = 7")) {
            // Get.to(() => const NoInternetScreen());
            // if (Get.currentRoute != Routes.NONETWORK) {
            //   Get.offAllNamed(Routes.NONETWORK);
            // }
          } else {
            if (value.statusText!.contains("timed out") ||
                value.statusText!.contains("TimeoutException")) {
              status = Strings.connectionTimeout;
            }
            EasyLoading.show(
              status: status,
              indicator: const Icon(
                Icons.info_rounded,
                color: Colors.red,
                size: 64,
              ),
              dismissOnTap: true,
              // duration: const Duration(seconds: 5),
              maskType: EasyLoadingMaskType.black,
            );
          }
        }
        return value;
      },
    );
  }

  Stream<Response> getMethodAsStream(String path, Map<String, dynamic> data) {
    // await Future.delayed(constDuration(seconds: 5));
    return get(path).then(
      (value) {
        if (value.statusCode == null) {
          // EasyLoading.dismiss();
          var status = value.statusText;
          if (value.statusText!.contains("SocketException")) {
            // Get.to(() => const NoInternetScreen());
            if (Get.currentRoute != Routes.NONETWORK) {
              Get.offAllNamed(Routes.NONETWORK);
            }
          } else {
            EasyLoading.show(
              // status: value.statusText,
              status: status,
              indicator: const Icon(
                Icons.info_rounded,
                color: Colors.red,
                size: 64,
              ),
              dismissOnTap: true,
              // duration: const Duration(seconds: 5),
              maskType: EasyLoadingMaskType.black,
            );
          }
        }
        return value;
      },
    ).asStream();
  }

  Future<Response> deleteMethod(String path) {
    return delete(path);
  }
}
