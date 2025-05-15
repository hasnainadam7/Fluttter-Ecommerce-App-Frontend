import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/product/ratings/rating_bar_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_string.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(CImages.userProfileImage1)),
                const SizedBox(width: CSizes.spaceBtwItems),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height:CSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const CRatingBarIndicator(rating: 4),
            const SizedBox(width: CSizes.spaceBtwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate & make purchases seamlessly. great job!!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CColors.primaryColor),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CColors.primaryColor),
        ),
        const SizedBox(height: CSizes.spaceBtwItems),

        /// Company Review
        CRoundedContainer(
          backgroundColor: dark ?CColors.darkerGrey : CColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(CSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Algoace's Store", style: Theme.of(context).textTheme.titleMedium),
                    Text("02 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate & make purchases seamlessly. great job!!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CColors.primaryColor),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CColors.primaryColor),
                ),
              ],
            ),
          )
        ),
        const SizedBox(height: CSizes.spaceBtwSections),
      ],
    );
  }
}
