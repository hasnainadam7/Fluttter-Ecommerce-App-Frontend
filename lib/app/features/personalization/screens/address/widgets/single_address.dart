import 'package:ecommerceapp/app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerceapp/app/features/shop/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class CSingleAddress extends StatelessWidget {
  const CSingleAddress({super.key, required this.onTap, required this.address});
  final VoidCallback onTap;
  final AddressModel address;

  // final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final bool selectedAddress = selectedAddressId == address.id;
      return GestureDetector(

        onTap: onTap,
        child: Center(
          child: CRoundedContainer(
            width: double.infinity,
            showBorder: true,
            padding: const EdgeInsets.all(CSizes.md),
            backgroundColor:
                selectedAddress ? CColors.primaryColor.withValues(alpha: 0.5) : Colors.transparent,
            borderColor:
                selectedAddress
                    ? Colors.transparent
                    : dark
                    ? CColors.darkerGrey
                    : CColors.grey,
            margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    selectedAddress ? Iconsax.tick_circle5 : null,
                    color:
                        selectedAddress
                            ? dark
                                ? CColors.light
                                : CColors.dark
                            : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: CSizes.sm / 2),
                    Text(address.phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: CSizes.sm / 2),
                    Text(
                      '${address.street}, ${address.city}, ${address.state}, ${address.postalCode}, ${address.country}',
                      softWrap: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
