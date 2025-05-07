import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/add_new_address.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = 2;
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
          child: Column(
            children: List.generate(4, (r) {
              return CSingleAddress(selectedAddress: selectedIndex == r);
            }),
            // children: [
            //   CSingleAddress(selectedAddress: true),
            //   CSingleAddress(selectedAddress: false),
            // ],
          ),
        ),
      ),
    );
  }
}
