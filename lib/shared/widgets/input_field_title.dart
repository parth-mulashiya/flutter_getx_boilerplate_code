// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class InputFieldTitle extends StatelessWidget {
  final String title;
  final bool isRequired;
  final double? leftPadding;
  final double? fontSize;
  const InputFieldTitle({
    super.key,
    required this.title,
    required this.isRequired,
    this.leftPadding = 20,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: leftPadding!.w, top: 5.h, bottom: 3.h),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: fontSize ?? 12.sp,
              color: ColorConstants.gray,
            ),
          ),
          isRequired
              ? Text(
                " *",
                style:
                    Theme.of(context).textTheme.bodySmall!
                      ..copyWith(fontSize: 12.sp, color: ColorConstants.red),
              )
              : Container(),
        ],
      ),
    );
  }
}
