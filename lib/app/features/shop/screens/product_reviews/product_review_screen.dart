import 'package:flutter/material.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../common/widgets/product/ratings/rating_bar_indicator.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/rating_progress_indicator.dart';
import 'widgets/user_review_card.dart';


class ProductReviewScreen extends StatelessWidget {
  const  ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /// -- Appbar
      appBar:  const CAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings & reviews are verified and are from people who use the same type of device that you use'),
              const SizedBox(height: CSizes.spaceBtwItems),

              /// Overall Product Ratings
               COverallProductRating(),
              const CRatingBarIndicator(rating: 4.8),
              Text('12,612', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: CSizes.spaceBtwSections),
              ...List.generate(4, (r){
                return const UserReviewCard();
              }),
              /// User Reviews List


            ],
          ),
        ),
      ),
    );
  }
}