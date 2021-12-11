import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/Core/Routes/app_route_page.dart';

import 'package:note_app/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.locale,
      theme: AppTheme.darkThemeCopy,
      defaultTransition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutePages.pages,
    );
  }
}
