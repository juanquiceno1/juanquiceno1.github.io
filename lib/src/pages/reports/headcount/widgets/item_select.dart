import 'package:flutter/material.dart';

import '../../../../utils/theme/colors.dart';

class ItemSelect extends StatelessWidget {
  final String icon;
  final String description;
  final String select;
  final String selectDefine;
  const ItemSelect({
    Key? key,
    required this.icon,
    required this.description,
    required this.select,
    required this.selectDefine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        icon,
        color: select == selectDefine ? AppColors.green : AppColors.black,
        height: 30,
      ),
      SizedBox(width: 10),
      Text(
        description,
        style: TextStyle(
          color: select == selectDefine ? AppColors.green : AppColors.black,
        ),
      ),
    ]);
  }
}
