import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CSectionHeading extends StatelessWidget {
  const CSectionHeading({
    super.key,
    this.buttonTitle = "View All",
    required this.title,
    this.textColor = CColors.white,
    this.showActionButton = true,
    this.onPressed,
    this.padding = EdgeInsets.zero, required this.dark,

  });

  final String buttonTitle, title;
  final Color textColor;
  final bool showActionButton;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  final bool dark ;
  @override
  Widget build(BuildContext context) {
    final bool dark = CHelperFunctions.isDarkMode(context);
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
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: dark ? CColors.white : CColors.black),
          ),
          if (showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle)),
        ],
      ),
    );
  }
}
