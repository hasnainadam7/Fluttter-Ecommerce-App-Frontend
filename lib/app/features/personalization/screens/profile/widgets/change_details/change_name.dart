import 'package:ecommerceapp/app/common/widgets/appBar/app_bar.dart';
import 'package:ecommerceapp/app/features/personalization/controllers/change_name_controller.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/texts.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: CAppBar(
        showBackArrow: true,
        title: Text("Change Name", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          spacing: CSizes.spaceBtwSections,
          children: [
            const Text(
              "Use real name for easy verification. This name will appear on several pages",
            ),
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                spacing: 10,
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    expands: false,
                    validator: (value) => CValidator.validateEmptyText(CTexts.firstName, value),
                    decoration: const InputDecoration(
                      labelText: CTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  TextFormField(
                    controller: controller.lastName,
                    expands: false,
                    validator: (value) => CValidator.validateEmptyText(CTexts.lastName, value),
                    decoration: const InputDecoration(
                      labelText: CTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {
                controller.updateUserName();
              }, child: const Text("Save")),
            ),
          ],
        ),
      ),
    );
  }
}
