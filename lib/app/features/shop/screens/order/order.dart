import 'widgets/orders_list.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: CAppBar(
        title:
            Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(CSizes.defaultSpace),

        /// -- Orders
        child: COrderListItems(),
      ),
    );
  }
}
