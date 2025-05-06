import 'package:flutter/material.dart';

import '../../../../../../common/widgets/appBar/app_bar.dart';
import '../../../../../auth/screens/app_bar/counter_icon.dart';
import 'home_app_bar_title.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.dark});
final bool dark;
  @override
  Widget build(BuildContext context) {
    return  CAppBar(
      title: const HomeAppBarTitles(),
      actions: [CounterIcon(dark:!dark ,)],
    );
  }
}


