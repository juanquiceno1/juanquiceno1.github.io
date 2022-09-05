import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';

class CardDescription extends StatelessWidget {
  final String icon;
  final String description;
  final VoidCallback? onPress;
  const CardDescription({
    Key? key,
    required this.icon,
    required this.description,
    this.onPress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: AppColors.transparent,
            ),
          ),
          elevation: 5,
          color: AppColors.white,
          child: InkWell(
            onTap: onPress,
            borderRadius: BorderRadius.circular(25),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Row(
                children: [
                  Image.asset(
                    icon,
                    height: 5.h,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        'assets/no-image.png',
                        width: 50,
                      );
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        description,
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/next.png',
                    height: 15,
                  ),
                  Image.asset(
                    'assets/images/next.png',
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
