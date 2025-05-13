import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_boilerplate_code/api/api.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
import '../shared/constants/strings.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    // Set your base URL and other configurations here
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.defaultContentType = 'application/json';
    httpClient.timeout = const Duration(seconds: 30);

    // Add request modifiers if needed
    httpClient.addRequestModifier<dynamic>((request) {
      // You can add headers or modify the request here
      return request;
    });

    // Add response modifiers if needed
    httpClient.addResponseModifier<dynamic>((request, response) {
      // You can modify or process the response here
      return response;
    });

    super.onInit();
  }

  Future<Response> getMethod(String path, {Map<String, dynamic>? query}) {
    return get(path, query: query).then((value) {
      return _handleResponse(value);
    });
  }

  Future<Response> postMethod(String path, Map<String, dynamic>? data) {
    return post(path, data).then((value) {
      return _handleResponse(value);
    });
  }

  Future<Response> putMethod(String path, Map<String, dynamic>? data) {
    return put(path, data).then((value) {
      return _handleResponse(value);
    });
  }

  Future<Response> postMethodList(String path, dynamic data) {
    return post(path, data).then((value) {
      return _handleResponse(value);
    });
  }

  Stream<Response> getMethodAsStream(String path, Map<String, dynamic> data) {
    return get(path).then((value) {
      return _handleResponse(value);
    }).asStream();
  }

  Future<Response> deleteMethod(String path) {
    return delete(path).then((value) {
      return _handleResponse(value);
    });
  }

  // Helper method to handle common response processing
  Response _handleResponse(Response value) {
    if (value.statusCode == null) {
      EasyLoading.dismiss();
      var status = value.statusText;
      log(status.toString());

      if (value.statusText!.contains("errno = 7")) {
        if (value.request!.url.toString().contains("auth")) {
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
          maskType: EasyLoadingMaskType.black,
        );
      }
    }
    return value;
  }
}
