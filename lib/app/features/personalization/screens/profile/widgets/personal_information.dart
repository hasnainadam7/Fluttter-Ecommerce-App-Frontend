import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import 'profile_menu.dart';
class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    super.key,
    required this.dark,
    required this.personalInformation,
  });

  final bool dark;
  final List<Map<String, dynamic>> personalInformation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CSectionHeading(
          title: "Personal Information",
          dark: dark,
          showActionButton: false,
          padding: EdgeInsets.zero,
        ),

        ...personalInformation.map((r) {
          return ProfileMenu(
            onPressed: r['onPressed'],
            icon: r['icon'] ?? Iconsax.arrow_right_34,
            title: r['title'],
            value: r['value'],
          );
        }),
        const Divider(),
      ],
    );
  }
}