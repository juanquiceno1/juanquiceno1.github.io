import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';

class ContainerDescription extends StatelessWidget {
  final String? icon;
  final IconData? icons;
  final String description;
  final String data;
  final VoidCallback? onPress;
  const ContainerDescription({
    Key? key,
    this.icon,
    required this.description,
    required this.data,
    this.onPress,
    this.icons,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Card(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: AppColors.transparent,
          ),
        ),
        elevation: 5,
        color: AppColors.white,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onPress,
          borderRadius: BorderRadius.circular(25),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.primaryColor.withOpacity(0.1)),
                  child: icons != null
                      ? Icon(
                          icons,
                          color: AppColors.primaryColor,
                          size: 30,
                        )
                      : icon!.contains('.svg')
                          ? SvgPicture.asset(
                              icon!.contains('assets/')
                                  ? icon!
                                  : 'assets/images/$icon',
                              color: AppColors.primaryColor,
                            )
                          : Image.asset(
                              icon!.contains('assets/')
                                  ? icon!
                                  : 'assets/images/$icon',
                              color: AppColors.primaryColor,
                            ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subtitle1!
                            .copyWith(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .subtitle1
                                  ?.color
                                  ?.withOpacity(0.6),
                            ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        data,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subtitle1!
                            .copyWith(
                              fontSize: 16.sp,
                            ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
