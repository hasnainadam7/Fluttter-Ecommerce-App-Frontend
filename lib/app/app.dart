import 'package:ecommerceapp/app/bindings/general_bindings.dart';
import 'package:ecommerceapp/app/routes/routes.dart';
import 'package:ecommerceapp/app/utils/theme/theme.dart' show CThemeApp;

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart' show GetMaterialApp;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Commerce",
      themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
      initialBinding: GeneralBindings(),

      theme: CThemeApp.lightThemeData,
      darkTheme: CThemeApp.darkThemeData,
      home: Center(child: CircularProgressIndicator()),
      //     initialRoute: Routes.onboarding,
      getPages: Routes.routes,
    );
  }
}
