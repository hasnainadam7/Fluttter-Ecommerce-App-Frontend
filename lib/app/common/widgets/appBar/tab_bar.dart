import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';

class CTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CTabBar({super.key, required this.dark, required this.tabs});

  final bool dark;
  final List<Map<String,String>> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark ? CColors.black : Colors.white,

      padding: const EdgeInsets.only(bottom: CSizes.sm),
      child: TabBar(
        tabAlignment: TabAlignment.start,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        isScrollable: true,
        indicatorColor: CColors.primaryColor,
        labelColor: dark ? CColors.white : CColors.black,
        unselectedLabelColor: CColors.darkGrey,
        tabs: tabs.map((tab) => Tab(child: Text(tab['name'] ??""))).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(CDeviceUtils.getAppBarHeight());
}
