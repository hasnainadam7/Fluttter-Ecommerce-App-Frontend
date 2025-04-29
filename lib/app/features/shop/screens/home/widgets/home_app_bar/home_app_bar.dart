import 'package:flutter/material.dart';

import '../../../../../../common/widgets/appBar/app_bar.dart';
import '../../../../../auth/screens/app_bar/counter_icon.dart';
import 'home_app_bar_title.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CAppBar(
      title: HomeAppBarTitles(),
      actions: [CounterIcon()],
    );
  }
}


