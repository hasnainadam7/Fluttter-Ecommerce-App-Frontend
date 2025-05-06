import 'package:ecommerceapp/app/features/shop/screens/shop/widgets/body/tab_bar_view.dart';
import 'package:ecommerceapp/app/features/shop/screens/shop/widgets/flexiable_space_widget/tab_bar_view.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart' show CHelperFunctions;
import 'package:flutter/material.dart';
import 'package:get/get.dart' show Get, GetNavigation;
import '../../../../common/widgets/appBar/app_bar.dart' show CAppBar;
import '../../../../common/widgets/appBar/tab_bar.dart' show CTabBar;
import '../../../auth/screens/app_bar/counter_icon.dart' show CounterIcon;

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});
  final List<String> tabs = ['Sports', 'Furniture', 'Electronics', 'Clothes', 'Cosmetics'];
  @override
  Widget build(BuildContext context) {
    bool dark = CHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: CAppBar(
          title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: [CounterIcon(dark: dark)],

        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true, // Set this to false to avoid stacking issue

                expandedHeight: Get.height * 0.42,
                // expandedHeight: 440,
                flexibleSpace: ShopFlexibleSpaceWidget(dark: dark),
                bottom: CTabBar(dark: dark, tabs: tabs),
              ),
            ];
          },
          body: CTabBarView(tabs: tabs, dark: dark),
        ),
      ),
    );
  }
}
