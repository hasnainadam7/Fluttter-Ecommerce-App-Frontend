
import 'package:ecommerceapp/app/routes/routes.dart';
import 'package:ecommerceapp/app/utils/theme/theme.dart' show CThemeApp;
import 'package:flutter/material.dart' show BuildContext, StatelessWidget, ThemeMode, Widget;
import 'package:get/get_navigation/src/root/get_material_app.dart' show GetMaterialApp;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Commerce",
      themeMode: ThemeMode.dark,
      // themeMode: ThemeMode.light,
      theme: CThemeApp.lightThemeData,
      darkTheme: CThemeApp.darkThemeData,

      initialRoute: Routes.onboarding,
      getPages: Routes.routes,
    );
  }
}
