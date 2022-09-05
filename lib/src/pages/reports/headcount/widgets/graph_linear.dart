import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/theme/colors.dart';

class GraphLinear extends StatelessWidget {
  final int total;
  final int amount;
  final String description;
  final bool isVertical;
  const GraphLinear(
      {Key? key,
      required this.total,
      required this.amount,
      required this.description,
      required this.isVertical})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            _amount(context),
            Expanded(child: Container()),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 3,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                if (amount != 0)
                  Container(
                    width: 5,
                    //12 es el alto que tiene contendor de la grafica si el
                    height: ((amount * 12) / total).h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
              ],
            ),
            Expanded(child: Container()),
            _description(context),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _description(context),
                ),
                _amount(context)
              ],
            ),
            SizedBox(height: 10),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: 90.w,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                if (amount != 0)
                  Container(
                    width: ((amount * 90) / total).w,
                    height: 5,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(
                          50,
                        )),
                  ),
              ],
            ),
          ],
        ),
      );
    }
  }

  Widget _amount(BuildContext context) => Text(
        amount.toString(),
        style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
      );

  Widget _description(BuildContext context) => Text(
        description,
        style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
      );
}
