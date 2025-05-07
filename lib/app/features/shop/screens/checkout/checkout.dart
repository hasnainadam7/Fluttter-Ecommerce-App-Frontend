import 'package:ecommerceapp/app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerceapp/app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerceapp/app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/product/cart/coupon_widget.dart';
import '../../../../common/widgets/sucess_screen/sucess_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CAppBar(
        showBackArrow: true,
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            spacing: CSizes.spacesBtwSections,
            children: [
              /// -- Items in Cart
              const CCartItems(showAddRemoveButton: false),


              /// -- Coupon TextField
              const CCouponCode(),


              /// -- Billing Section
              CRoundedContainer(
                showBorder: true,

                padding: const EdgeInsets.all(CSizes.md),
                backgroundColor: dark ? CColors.black : CColors.white,
                child: const Column(
                  spacing: CSizes.spaceBtwItems,
                  children: [
                    /// Pricing
                    CBillingAmountSection(),

                    /// Divider
                    Divider(),

                    /// Payment Methods
                    CBillingPaymentSection(),

                    /// Address
                    CBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: ElevatedButton(
          onPressed:
              () => Get.to(
                () => SucessScreen(
                  image: CImages.successfulPaymentIcon,
                  title: 'Payment Success!',
                  subTitle: 'Your item will be shipped soon!',
                  onPressed: () => Get.offAll(() => NavigationMenu()),
                  btnText: CTexts.tContinue,
                ),
              ),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
