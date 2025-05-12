import 'package:ecommerceapp/app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/shimmer_effect/shimmer_effect.dart';
import '../../../../../../utils/constants/colors.dart';

class HomeAppBarTitles extends StatelessWidget {
  const HomeAppBarTitles({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good day for shopping",
          style: Theme.of(context).textTheme.labelMedium!.apply(color: CColors.grey),
        ),
        Obx(() {
          if (controller.loader.value) {
            return const Column(
              children: [SizedBox(height: 5), CShimmerEffect(width: double.infinity, height: 20)],
            );
          }else{
            return Text(
              controller.user.value.fullName,

              style: Theme.of(context).textTheme.headlineMedium!.apply(color: CColors.white),
            );
          }

        }),
      ],
    );
  }
}
