import 'package:ecommerceapp/app/features/personalization/controllers/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../common/widgets/shimmer_effect/shimmer_effect.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import 'widgets/add_new_address.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: CColors.primaryColor,
        child: const Icon(Iconsax.add, color: CColors.white),
      ),
      appBar: CAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: FutureBuilder(
            future: controller.fetchUserAddress(),
            builder: (context, snapshot) {
              var loader = CShimmerEffect(width: Get.width / 2.3);
              final nothingFound = CAnimationLoaderWidget(
                text: "Whoops! Wishlist is Empty...",
                animation: CImages.pencilAnimation,
                showAction: true,
                actionText: 'Let\'s add some',
                onActionPressed: () => Get.to(() => const AddNewAddressScreen()),
              );
              var widget = CCloudHelperFunctions.checkMultiRecordState(
                snapshot: snapshot,
                loader: loader,
                nothingFound: nothingFound,
              );

              if (widget != null) return widget;
              final address = snapshot.data!;
              return Column(
                children: address.map((addr) {
                  return CSingleAddress(
                    onTap: () => controller.selectAddress(addr),
                    address: addr,
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
