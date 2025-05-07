
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appBar/app_bar.dart' ;
import '../../../../common/widgets/appBar/tab_bar.dart' ;
import '../../../../utils/helpers/helper_functions.dart';
import '../../../auth/screens/app_bar/counter_icon.dart' ;
import 'widgets/body/tab_bar_view.dart';
import 'widgets/flexible_space_widget/tab_bar_view.dart';

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
