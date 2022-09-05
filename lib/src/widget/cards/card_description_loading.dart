import 'package:client/src/widget/shimmer/shimmer_generic.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';

class CardDescriptionLoading extends StatelessWidget {
  const CardDescriptionLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          color: AppColors.transparent,
        ),
      ),
      elevation: 5,
      color: AppColors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            ShimmerGeneric(
              radius: 50,
              height: 70,
              width: 70,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerGeneric(
                    width: 70.w,
                    align: Alignment.centerLeft,
                  ),
                  SizedBox(height: 4),
                  ShimmerGeneric(
                    width: 50.w,
                    height: 20,
                    align: Alignment.centerLeft,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
