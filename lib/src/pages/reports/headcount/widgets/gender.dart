import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/theme/colors.dart';
import 'graph_circular.dart';

class Gender extends StatelessWidget {
  final String men;
  final String women;
  final String type;
  const Gender({
    Key? key,
    required this.men,
    required this.women,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Divider(),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 5,
            runAlignment: WrapAlignment.spaceEvenly,
            children: [
              if (type == 'T' || type == 'M')
                GraphCircular(
                  progressInt: (double.tryParse(men) ?? 0).toInt(),
                  descriptionProgress: '$men%',
                  description: 'Hombres',
                  colorActive: AppColors.primaryColor,
                  colorOff: AppColors.green10,
                ),
              if (type == 'T' || type == 'F')
                GraphCircular(
                  progressInt: (double.tryParse(women) ?? 0).toInt(),
                  descriptionProgress: '$women%',
                  description: 'Mujeres',
                  colorActive: AppColors.yellow,
                  colorOff: AppColors.yellow.withOpacity(0.2),
                )
            ],
          )
        ],
      );
}
