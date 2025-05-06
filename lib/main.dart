import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_boilerplate_code/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_binding.dart';
import 'routes/routes.dart';

void main() {
  configLoading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter GetX Boilerplate',
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
          initialBinding: AppBinding(),
          initialRoute: Routes.SPLASH,
          theme: ThemeConfig.lightTheme,
          // home: ,
        );
      },
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingFour
    ..loadingStyle = EasyLoadingStyle.light
    ..radius = 10.0
    ..indicatorColor = Colors.black
    ..progressColor = Colors.deepPurpleAccent
    ..textColor = const Color(0xFF64DEE0)
    ..maskType = EasyLoadingMaskType.clear
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
