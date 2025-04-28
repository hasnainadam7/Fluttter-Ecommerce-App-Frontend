import 'package:flutter/material.dart';

import 'curved_edges.dart';

class CCurvedEdgesWidget extends StatelessWidget {
  const CCurvedEdgesWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CCurvedEdges(),

      child: child,
    );
  }
}