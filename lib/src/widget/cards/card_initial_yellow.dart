import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';

class CardInitialYellow extends StatelessWidget {
  final String description;
  const CardInitialYellow({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 10.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.yellow2.withOpacity(0.3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        description,
        style: Theme.of(context).primaryTextTheme.caption!.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
