import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';
import '../images/image_fade.dart';

class CardDescriptionStatus extends StatelessWidget {
  final String image;
  final String title;
  final String name;
  final String location;
  final DateTime date;
  final String? id;
  final int? type;
  final String? status;
  final Widget? widget;
  const CardDescriptionStatus({
    Key? key,
    required this.image,
    required this.title,
    required this.name,
    required this.location,
    required this.date,
    this.id,
    this.type,
    this.status,
    this.widget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            ]),
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
                      )),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText2!
                            .copyWith(
                              fontSize: 15.sp,
                            ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        name,
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                      SizedBox(height: 3),
                      Text(
                        location,
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
                SizedBox(width: 10),
                if (widget != null) widget!
              ],
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (id != null)
                    Expanded(
                      child: Text(
                        id ?? '',
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
                      ),
                    ),
                  if (status != null) Expanded(child: Container()),
                  if (status != null)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                      margin: EdgeInsets.only(left: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: type == 1
                            ? AppColors.primaryColor.withOpacity(0.1)
                            : AppColors.yellow2.withOpacity(0.1),
                        border: Border.all(
                          color: type == 1
                              ? AppColors.primaryColor
                              : AppColors.yellow2,
                        ),
                      ),
                      child: Text(
                        status ?? '',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: type == 1
                              ? AppColors.primaryColor
                              : AppColors.yellow2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      );
}
