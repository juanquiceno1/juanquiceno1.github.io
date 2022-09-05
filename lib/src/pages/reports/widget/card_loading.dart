import 'package:client/src/widget/shimmer/shimmer_generic.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/theme/colors.dart';

class CardLoading extends StatelessWidget {
  const CardLoading({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        width: 100.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppColors.darkGrey.withOpacity(0.1),
                blurRadius: 3.0,
                offset: Offset(0.1, 0.1),
                spreadRadius: 3.0)
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShimmerGeneric(
                  height: 15.w,
                  width: 15.w,
                  radius: 50,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerGeneric(
                        align: Alignment.centerLeft,
                        height: 20,
                        width: 70.w,
                      ),
                      SizedBox(height: 5),
                      ShimmerGeneric(
                        align: Alignment.centerLeft,
                        height: 25,
                        width: 50.w,
                      ),
                      SizedBox(height: 5),
                      ShimmerGeneric(
                        align: Alignment.centerLeft,
                        height: 22,
                        width: 40.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: ShimmerGeneric(
                align: Alignment.centerLeft,
                height: 20,
                width: 40.w,
              ),
            ),
          ],
        ),
      );
}
