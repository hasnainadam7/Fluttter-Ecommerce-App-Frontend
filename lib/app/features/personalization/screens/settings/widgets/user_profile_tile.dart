import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/images/circular_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_string.dart';
import '../../../controllers/user_controller.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ListTile(
      leading: Obx(
        () => CCircularImage(
          isNetworkImage: controller.user.value.profilePicture != '',
          imgPath:
              controller.user.value.profilePicture != ''
                  ? controller.user.value.profilePicture
                  : CImages.userProfileImage2,
          height: 50,
          width: 50,
          padding: 0,
        ),
      ),

      title: Obx(
        () => Text(
          controller.user.value.fullName,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: CColors.white),
        ),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: CColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: CColors.white),
      ),
    );
  }
}
