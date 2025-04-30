import 'package:flutter/material.dart';
import 'circular_container.dart';
import '../curved_edges/curved_edges_widget.dart';
import '../../../../utils/constants/colors.dart';

class CPrimaryHeaderContainer extends StatelessWidget {
  const CPrimaryHeaderContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CCurvedEdgesWidget(
      child: Container(
        color: CColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          // width: Get.width,
          // height: Get.height * 0.47,
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
