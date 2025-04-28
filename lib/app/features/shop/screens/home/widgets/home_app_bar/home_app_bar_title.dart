import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/texts.dart';

class HomeAppBarTitles extends StatelessWidget {
  const HomeAppBarTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          CTexts.homeAppbarTitle,
          style: Theme.of(context).textTheme.labelMedium!.apply(color: CColors.grey),
        ),
        Text(
          CTexts.homeAppbarSubTitle,

          style: Theme.of(context).textTheme.headlineMedium!.apply(color: CColors.white),
        ),
      ],
    );
  }
}