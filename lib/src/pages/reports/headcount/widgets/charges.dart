import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/theme/colors.dart';
import 'graph_linear.dart';

class Charges extends StatelessWidget {
  final int length;
  final List loads;
  const Charges({
    Key? key,
    required this.length,
    required this.loads,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Cargos',
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
          SizedBox(height: 20),
          for (var item in loads)
            GraphLinear(
              amount: item['value'],
              total: length,
              description: item['title'],
              isVertical: false,
            ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
          ),
          SizedBox(height: 20),
        ],
      );
}
