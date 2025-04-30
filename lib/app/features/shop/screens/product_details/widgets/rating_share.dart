import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class CRatingAndShare extends StatelessWidget {
  const CRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          spacing: CSizes.spaceBtwItems/2,
          children: [
            const Icon(Iconsax.star5,color: Colors.amber,size: 24,),
            Text.rich(TextSpan(
                children: [
                  TextSpan(text: '5.0',style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: ' (199)'),
                ]
            ))

          ],
        ),
        IconButton(onPressed: (){}, icon: const Icon(Icons.share,size:CSizes.iconsMd,))
      ],);
  }
}