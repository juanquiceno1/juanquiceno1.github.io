import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GraphCircular extends StatelessWidget {
  final int progressInt;
  final String descriptionProgress;
  final String description;
  final Color colorActive;
  final Color colorOff;
  const GraphCircular(
      {Key? key,
      required this.progressInt,
      required this.descriptionProgress,
      required this.description,
      required this.colorActive,
      required this.colorOff})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        width: 40.w,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularCountdown(
              countdownTotal: 100,
              countdownRemaining: progressInt,
              countdownRemainingColor: colorActive,
              // countdownCurrentColor: AppColors.green10,
              countdownTotalColor: colorOff,
              isClockwise: false,
              strokeWidth: 10,
              gapFactor: 2,
              diameter: 35.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  descriptionProgress,
                  style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  description,
                  style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            )
          ],
        ),
      );
}
