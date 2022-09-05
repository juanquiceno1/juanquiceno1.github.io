import 'package:client/src/utils/resposive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';

class IconDescriptionButton extends StatelessWidget {
  final String description;
  final String icon;
  final VoidCallback? onPress;
  const IconDescriptionButton({
    Key? key,
    required this.description,
    required this.icon,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: Responsive.isMobile(context) ? 20.h : 150,
        width: Responsive.isMobile(context) ? 40.w : 150,
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: AppColors.transparent,
            ),
          ),
          color: AppColors.primaryColor,
          shadowColor: AppColors.primaryColor.withOpacity(0.5),
          elevation: 10,
          child: InkWell(
            onTap: onPress,
            borderRadius: BorderRadius.circular(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  height: Responsive.isMobile(context) ? 7.h : 60,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    description,
                    style: Theme.of(context).primaryTextTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
