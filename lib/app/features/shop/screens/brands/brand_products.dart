import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/product/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/category_controller.dart';


class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.title, required this.imgPath});
  final String imgPath,title;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: CAppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              CBrandCard(showBorder: true,  imgPath: imgPath, title:title,),
              SizedBox(height:CSizes.spacesBtwSections),

              CSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
