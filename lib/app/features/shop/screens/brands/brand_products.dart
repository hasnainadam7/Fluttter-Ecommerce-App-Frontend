import 'package:flutter/material.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/product/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.title, required this.imgPath, required this.id});
  final String imgPath, title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              CBrandCard(showBorder: true, imgPath: imgPath, title: title),
              const SizedBox(height: CSizes.spaceBtwSections),

              CSortableProducts(id: id,),
            ],
          ),
        ),
      ),
    );
  }
}
