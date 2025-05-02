import 'package:ecommerceapp/app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CChoiceChip extends StatelessWidget {
  const CChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final bool isColor = CHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: !isColor
            ? Text(text)
            : const SizedBox(),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? CColors.white : null),
        avatar: isColor
            ? CCircularContainer(
            width: 50,
            height: 50,
            backgroundColor: CHelperFunctions.getColor(text)!) : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? CHelperFunctions.getColor(text)! : null,
      
      ),
    );
  }
}
