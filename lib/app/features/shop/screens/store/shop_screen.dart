import 'package:ecommerceapp/app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerceapp/app/features/shop/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../common/widgets/appBar/tab_bar.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../auth/screens/app_bar/counter_icon.dart';
import 'widgets/body/tab_bar_view.dart';
import 'widgets/flexible_space_widget/shop_flexible_space_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {

    bool dark = CHelperFunctions.isDarkMode(context);

    return Obx(() {
      final List<Map<String, String>> tabs = CategoryController.instance.allCategories
          .map((cat) => {'name': cat.name, 'image': cat.image})
          .toList();

      return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: CAppBar(
            title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
            actions: [CounterIcon(dark: dark)],
          ),
          body: CategoryController.instance.isLoading.value
              ? const CShimmerEffect(width: double.infinity)
              : NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  expandedHeight: Get.height * 0.42,
                  flexibleSpace: ShopFlexibleSpaceWidget(dark: dark),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: CTabBar(dark: dark, tabs: tabs),
                  ),
                ),
              ];
            },
            body: CTabBarView(tabs: tabs, dark: dark,),
          ),
        ),
      );
    });

  }
}
