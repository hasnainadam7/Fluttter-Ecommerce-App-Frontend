import 'package:ecommerceapp/app/utils/routes/app_routes.dart';
import 'package:ecommerceapp/app/utils/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "E-Commerce",
      themeMode: ThemeMode.dark,
      // themeMode: ThemeMode.light,
      theme: CThemeApp.lightThemeData,
      darkTheme: CThemeApp.darkThemeData,
      // home: OnboardingScreen(),
      initialRoute: Routes.onboarding,
      getPages: Routes.routes,
    );
  }
}
