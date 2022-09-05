import 'package:flutter/material.dart';

import '../../utils/theme/colors.dart';

class GreenDot extends StatelessWidget {
  const GreenDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
