import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    this.buttonTitle = "View All",
    required this.title,
    this.textColor = CColors.white,
    this.showActionButton = true,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
  });

  final String buttonTitle, title;
  final Color textColor;
  final bool showActionButton;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // spacing: CSizes.spaceBtwItems,
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,

            title,

            style: Theme.of(context).textTheme.headlineSmall!.apply(color: CColors.white),
          ),
          if (showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle)),
        ],
      ),
    );
  }
}
