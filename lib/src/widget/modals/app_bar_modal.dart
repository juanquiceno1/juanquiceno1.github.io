import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../routes/navigation.dart';
import '../../utils/theme/colors.dart';

class AppBarModal extends StatelessWidget {
  final String? title;

  const AppBarModal({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            height: 0.6.h,
            width: 15.w,
            margin: EdgeInsets.symmetric(vertical: 1.h),
            decoration: BoxDecoration(
                color: AppColors.darkGrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(25)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title ?? 'Seleccione',
                    style:
                        Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                ),
                IconButton(
                    onPressed: () => navigatePop(context, false),
                    icon: Icon(
                      Icons.close_rounded,
                      color: AppColors.primaryColor,
                    ))
              ],
            ),
          )
        ],
      );
}
