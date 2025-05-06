import 'package:flutter/material.dart';

import 'progress_indicator_and_rating.dart';

class COverallProductRating extends StatelessWidget {
  COverallProductRating({super.key});
  final List<Map<String, double>> progressValues = [
    {'5': 1},
    {'4': 0.8},
    {'3': 0.6},
    {'2': 0.4},
    {'1': 0.2},
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        Expanded(
          flex: 7,
          child: Column(
            children:
                progressValues.map((r) {
                  return CRatingProgressIndicator(text: r.keys.first, value: r.values.first);
                }).toList(),
          ),
        ),
      ],
    );
  }
}
