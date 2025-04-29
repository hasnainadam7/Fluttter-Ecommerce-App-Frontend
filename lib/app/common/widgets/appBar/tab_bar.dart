import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';

class CTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CTabBar({super.key, required this.isDark, required this.tabs});

  final bool isDark;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {

    return Container(
      color:isDark?Colors.black: Colors.white,
      padding: const EdgeInsets.only(bottom: CSizes.sm),
      child: TabBar(
        isScrollable: true,
        indicatorColor: CColors.primaryColor,
        labelColor: isDark ? CColors.white : CColors.black,
        unselectedLabelColor: CColors.darkGrey,
        tabs: tabs.map((tab) => Tab(child: Text(tab))).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(CDeviceUtils.getAppBarHeight());
}
