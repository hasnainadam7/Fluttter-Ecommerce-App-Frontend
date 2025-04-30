import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/circular_images.dart';
import '../../../../../utils/constants/images_string.dart';

class ImageUploadSection extends StatelessWidget {
  const ImageUploadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CCircularImage(imgPath: CImages.user, height: 80, width: 80),
        TextButton(onPressed: () {}, child: const Text("Change Profile Picture")),
        const Divider(),
      ],
    );
  }
}
