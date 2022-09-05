import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GraphCircular extends StatelessWidget {
  final int progressInt;
  final String? descriptionProgress;
  final double? fontZisedProg;
  final String? description;
  final double? fontZisedDesc;
  final Color colorActive;
  final Color colorOff;
  final double? diameter;
  final double? strokeWidth;
  const GraphCircular(
      {Key? key,
      required this.progressInt,
      this.descriptionProgress,
      required this.colorActive,
      required this.colorOff,
      this.description,
      this.diameter,
      this.fontZisedProg,
      this.fontZisedDesc,
      this.strokeWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          CircularCountdown(
            countdownTotal: 100,
            countdownRemaining: progressInt,
            countdownRemainingColor: colorActive,
            countdownTotalColor: colorOff,
            isClockwise: false,
            strokeWidth: strokeWidth ?? 10,
            gapFactor: 2,
            diameter: diameter ?? 35.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (descriptionProgress != null)
                Text(
                  descriptionProgress ?? '',
                  style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                        fontSize: fontZisedProg ?? 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              if (description != null)
                Text(
                  description ?? '',
                  style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                        fontSize: fontZisedDesc ?? 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
            ],
          )
        ],
      );
}
