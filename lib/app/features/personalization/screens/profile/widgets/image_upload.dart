import 'package:ecommerceapp/app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/images/circular_images.dart';
import '../../../../../utils/constants/images_string.dart';

class ImageUploadSection extends StatelessWidget {
  const ImageUploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Column(
      children: [
        Obx(
          () => CCircularImage(
            isNetworkImage: controller.user.value.profilePicture != '',
            imgPath:
                controller.user.value.profilePicture != ''
                    ? controller.user.value.profilePicture
                    : CImages.userProfileImage2,
            height: 80,
            width: 80,
          ),
        ),

        TextButton(
          onPressed: () async {
            await controller.uploadImg();
          },
          child: const Text("Change Profile Picture"),
        ),
        const Divider(),
      ],
    );
  }
}
