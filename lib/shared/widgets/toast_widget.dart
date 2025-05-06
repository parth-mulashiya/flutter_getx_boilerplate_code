// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../constants/colors.dart';
import '../constants/common.dart';

SnackbarController toastWidget(String msg) {
  return Get.showSnackbar(
    GetSnackBar(
      backgroundColor: ColorConstants.black.withOpacity(0.5),
      borderRadius: 15.w,
      snackPosition: SnackPosition.BOTTOM,
      // maxWidth: Get.width,
      margin: EdgeInsets.only(bottom: Get.height * .1),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      duration: Duration(seconds: 2),
      animationDuration: Duration(microseconds: 500),
      maxWidth: Get.width * .7,
      messageText: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Iconsax.tick_circle_bold,
              color: ColorConstants.white,
              size: 19.w,
            ),
            SizedBox(width: 5.w),
            Text(
              msg,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                fontFamily: CommonConstants.font,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
