import 'package:flutter/material.dart';

import 'colors.dart';

class ShadowBox {
  final Color? color;
  final double? opacity;
  const ShadowBox({this.color, this.opacity});

  static List<BoxShadow> change({Color? color, double? opacity}) => <BoxShadow>[
        BoxShadow(
          color: color != null
              ? color.withOpacity(opacity ?? 0.1)
              : AppColors.black.withOpacity(opacity ?? 0.1),
          blurRadius: 1.0,
          offset: Offset(0.0, 1.0),
          spreadRadius: 1.0,
        ),
      ];

  // @override
  List<BoxShadow> build() {
    return change(
      color: color,
      opacity: opacity,
    );
  }
}
