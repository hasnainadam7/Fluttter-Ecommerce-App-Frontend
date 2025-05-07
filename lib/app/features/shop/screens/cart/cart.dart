import 'package:ecommerceapp/app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../utils/constants/sizes.dart';
import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(CSizes.defaultSpace),

        /// Items in Cart
        child: CCartItems()
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: ElevatedButton(
          // onPressed: (){},
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
