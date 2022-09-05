import 'package:flutter/material.dart';

import '../theme/colors.dart';

Widget getIcon(int id, int selectedIndex, {bool? remplace}) {
  switch (id) {
    case 0:
      return ImageIcon(
        AssetImage(
          'assets/bottom_navigation_bar/house.png',
        ),
        color: selectedIndex == 0 ? AppColors.primaryColor : AppColors.darkGrey,
      );
    case 1:
      return ImageIcon(
        AssetImage(
          'assets/bottom_navigation_bar/${selectedIndex == 1 ? 'notification_on.png' : 'notification_off.png'}',
        ),
        color: selectedIndex == 1 ? AppColors.primaryColor : AppColors.darkGrey,
      );
    case 2:
      return ImageIcon(
        AssetImage(
          'assets/bottom_navigation_bar/avatar.png',
        ),
        color: selectedIndex == 2 ? AppColors.primaryColor : AppColors.darkGrey,
      );
    case 3:
      return ImageIcon(
        AssetImage(
          'assets/bottom_navigation_bar/inform.png',
        ),
        color: selectedIndex == 3 ? AppColors.primaryColor : AppColors.darkGrey,
      );

    case 4:
      return ImageIcon(
        AssetImage(
          'assets/bottom_navigation_bar/profile.png',
        ),
        color: selectedIndex == 4 ? AppColors.primaryColor : AppColors.darkGrey,
      );
  }
  return Icon(Icons.add);
}
