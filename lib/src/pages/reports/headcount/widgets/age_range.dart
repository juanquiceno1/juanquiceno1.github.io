import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/theme/colors.dart';
import 'graph_linear.dart';

class AgeRange extends StatelessWidget {
  final int length;
  final List ageRange;
  const AgeRange({Key? key, required this.ageRange, required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Rango de Edad',
              style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Divider(),
          ),
          SizedBox(height: 40),
          Container(
            height: 20.h,
            width: 100.w,
            color: Colors.transparent,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Años',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .subtitle1!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  SizedBox(width: 10),
                  for (var item in ageRange)
                    GraphLinear(
                      amount: item['value'],
                      total: length,
                      description: item['title'],
                      isVertical: true,
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: AppColors.primaryColor,
                height: 10,
                width: 10,
                margin: EdgeInsets.only(right: 5),
              ),
              Text(
                'No. Empleados',
                style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          )
        ],
      );
}
