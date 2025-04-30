import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/images/circular_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_string.dart';
import '../../../../../utils/constants/texts.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key,  this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CCircularImage(imgPath: CImages.user, height: 50, width: 50, padding: 0),
      title: Text(
        CTexts.userName,
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: CColors.white),
      ),
      subtitle: Text(
        CTexts.userEmail,
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: CColors.white),
      ),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: CColors.white)),
    );
  }
}
