import 'package:client/src/widget/images/image_fade.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/theme/colors.dart';

class CardOtherReport extends StatelessWidget {
  final String image;
  final String item1;
  final String item2;
  final String item3;
  final String? item4;
  const CardOtherReport({
    Key? key,
    required this.image,
    required this.item1,
    required this.item2,
    required this.item3,
    this.item4,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        width: 100.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppColors.darkGrey.withOpacity(0.1),
                blurRadius: 3.0,
                offset: Offset(0.1, 0.1),
                spreadRadius: 3.0)
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 15.w,
                  width: 15.w,
                  color: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: ImageFade(
                      image: image,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item1,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subtitle1!
                            .copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                      Text(
                        item2,
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                      Text(
                        item3,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subtitle1!
                            .copyWith(
                              fontSize: 14.sp,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .subtitle1
                                  ?.color
                                  ?.withOpacity(0.7),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (item4 != null)
              Column(
                children: [
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          item4!,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .copyWith(
                                fontSize: 13.sp,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1
                                    ?.color
                                    ?.withOpacity(0.7),
                              ),
                        )
                      ],
                    ),
                  ),
                ],
              )
          ],
        ),
      );
}
