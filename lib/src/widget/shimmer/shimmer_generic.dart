import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';

class ShimmerGeneric extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;
  final Color? color;
  final Color? highlightColor;
  final Color? colorContainer;
  final Alignment? align;
  const ShimmerGeneric({
    Key? key,
    this.height,
    this.width,
    this.radius,
    this.color,
    this.colorContainer,
    this.marginTop,
    this.marginBottom,
    this.marginLeft,
    this.marginRight,
    this.highlightColor,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align ?? Alignment.center,
      child: Shimmer.fromColors(
        enabled: true,
        baseColor: color ?? AppColors.grey,
        highlightColor: highlightColor ?? AppColors.grey.withOpacity(0.5),
        child: Container(
          margin: EdgeInsets.only(
              top: marginTop ?? 0,
              bottom: marginBottom ?? 0,
              left: marginLeft ?? 0,
              right: marginRight ?? 0),
          height: height ?? 30,
          width: width ?? 60.w,
          decoration: BoxDecoration(
              color: colorContainer ?? Colors.grey,
              borderRadius: BorderRadius.circular(radius ?? 25)),
        ),
      ),
    );
  }
}
