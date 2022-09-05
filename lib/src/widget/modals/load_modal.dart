import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';

class LoadModal extends StatelessWidget {
  const LoadModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 5.h,
        width: 5.h,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 5.h),
        color: Colors.transparent,
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      );
}
