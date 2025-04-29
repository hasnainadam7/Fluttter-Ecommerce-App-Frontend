import 'package:ecommerceapp/app/common/imports/material_shortcuts.dart';
import 'package:ecommerceapp/app/common/widgets/appBar/app_bar.dart';
import 'package:ecommerceapp/app/features/shop/controllers/home_controller.dart';
import 'package:ecommerceapp/app/features/shop/screens/home/home_screen.dart';
import 'package:ecommerceapp/app/features/shop/screens/home/widgets/product_card_vertical/circular_icon.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../navigation_menu.dart';
import '../../../../utils/routes/app_routes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    final bool dark= CHelperFunctions.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return Scaffold(
      appBar: CAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [CircularIcon(
          iconColor: dark ? CColors.white:CColors.black,
          onTap: ()=> controller.changeIndex(0),
          dark: dark,iconData: Iconsax.add,),
        ], dark: dark),
      ) ;

  }
}
