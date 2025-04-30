import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import 'profile_menu.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
    required this.dark,
    required this.profileInformation,
  });

  final bool dark;
  final List<Map<String, dynamic>> profileInformation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CSectionHeading(
          title: "Profile Information",
          dark: dark,
          showActionButton: false,
          padding: EdgeInsets.zero,
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