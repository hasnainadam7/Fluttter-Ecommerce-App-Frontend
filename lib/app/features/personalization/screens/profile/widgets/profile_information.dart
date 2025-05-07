import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import 'profile_menu.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,

    required this.profileInformation, required this.dark,
  });


  final List<Map<String, dynamic>> profileInformation;
  final bool dark ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CSectionHeading(
          title: "Profile Information",

          showActionButton: false,
          padding: EdgeInsets.zero, dark: dark,
        ),
        ...profileInformation.map((r) {
          return ProfileMenu(
            onPressed: r['onPressed'],
            title: r['title'],
            value: r['value'],
          );
        }),
        const Divider(),
      ],
    );
  }
}