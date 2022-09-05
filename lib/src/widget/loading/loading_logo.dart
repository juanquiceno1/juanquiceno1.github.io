import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';

class LoadingLogo extends StatelessWidget {
  const LoadingLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.9),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/loading.gif',
              width: 60.w,
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 1.h),
            //   width: 60.w,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(20.0),
            //     child: LinearProgressIndicator(
            //       minHeight: 0.7.h,
            //       backgroundColor: AppColors.grey,
            //       valueColor: AlwaysStoppedAnimation<Color>(AppColors.red),
            //     ),
            //   ),
            // ),
            // Text('Cargando...', style: TextStyle(fontSize: 12.sp),),
          ],
        ),
      ],
    );
  }
}
