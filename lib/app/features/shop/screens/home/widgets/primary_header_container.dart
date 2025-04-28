import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CCurvedEdgesWidget(
      child: Container(
        color: CColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          // width: Get.width,
          height: 450,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CCircularContainer(
                  backgroundColor: CColors.textWhite.withValues(alpha: 0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CCircularContainer(
                  backgroundColor: CColors.textWhite.withValues(alpha: 0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}