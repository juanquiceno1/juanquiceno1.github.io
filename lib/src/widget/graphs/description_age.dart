import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';

class DescriptionGraphAge extends StatelessWidget {
  const DescriptionGraphAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: AppColors.primaryColor,
          height: 10.sp,
          width: 10.sp,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          'No. Empleados',
          style: TextStyle(color: AppColors.darkGrey, fontSize: 11.sp),
        )
      ],
    );
  }
}
