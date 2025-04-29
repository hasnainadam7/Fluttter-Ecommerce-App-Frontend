import 'dart:ui';

import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/images_string.dart';
import '../../imports/material_shortcuts.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_images.dart';
import '../texts/rounded_title_with_text_verified_logo.dart';

class CBrandedCard extends StatelessWidget {
  const CBrandedCard({super.key, this.showBorder = true, this.onTap});
  final bool showBorder;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    bool isDark = CHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: CRoundedContainer(
        // padding: EdgeInsets.all(CSizes.sm),
        showBorder: showBorder,
        backgroundColor: CColors.transparent,
        child: Row(
          spacing: 2,
          children: [
            Flexible(
              child: CCircularImage(
                imgPath: CImages.clothIcon,
                overlayColor: !isDark ? CColors.white : CColors.black,
                backgroundColor:  isDark ? CColors.white : CColors.black,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                // spacing: CSizes.sm ,
                children: [
                  CRoundedTitleWithTextVerifiedLogo(
                    title: "Nike",
                    brandTextSize: TextSizes.large,
                    textColor: isDark ? CColors.white : CColors.black,
                  ),
                  Text(
                    "256 Products",

                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium!.apply(color:
                    isDark ? CColors.white : CColors.black,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
