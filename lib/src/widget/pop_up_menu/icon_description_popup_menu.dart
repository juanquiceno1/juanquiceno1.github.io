import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';

class IconDescriptionPopUpMenu extends StatelessWidget {
  final IconData icon;
  final String description;
  const IconDescriptionPopUpMenu(
      {Key? key, required this.icon, required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(
            icon,
            color: AppColors.darkGrey,
            size: 28,
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              description,
              style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                    fontSize: 14.sp,
                  ),
            ),
          ),
        ],
      );
}
