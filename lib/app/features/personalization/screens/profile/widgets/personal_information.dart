import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import 'profile_menu.dart';
class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    super.key,

    required this.personalInformation, required this.dark,
  });


  final List<Map<String, dynamic>> personalInformation;
  final bool dark ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CSectionHeading(
          title: "Personal Information",
         
          showActionButton: false,
          padding: EdgeInsets.zero, dark: dark,
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