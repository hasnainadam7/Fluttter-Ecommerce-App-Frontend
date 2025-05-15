
import 'package:flutter/material.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../common/widgets/product/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.id});
final String id;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:
          const CAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: CSortableProducts(id:id),
          ),
        ),
      ),
    );
  }
}


