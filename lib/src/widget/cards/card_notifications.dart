import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../models/notification/notification_model.dart';
import '../../utils/theme/colors.dart';

class CardNotifications extends StatelessWidget {
  final Function()? onTap;
  final NotificationModel data;

  const CardNotifications({Key? key, this.onTap, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 100.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          '${data.createdAt.day}/${data.createdAt.month}/${data.createdAt.year}',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle1!
                              .copyWith(
                                  fontSize: 14.sp,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1
                                      ?.color
                                      ?.withOpacity(0.7)),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: data.status
                          ? Badge(
                              position: BadgePosition.topEnd(top: 1, end: 1),
                              ignorePointer: data.status,
                              badgeColor: AppColors.primaryColor,
                              toAnimate: true,
                              child: _statusNotification(),
                            )
                          : _statusNotification(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eu elit nunc. Praesent quis enim a lacus sollicitudin auctor sed a quam.',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1!
                      .copyWith(fontSize: 15.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusNotification() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: data.status ? AppColors.yellow2 : AppColors.darkGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      width: 50,
      child: Image.asset(
        'assets/images/notification.png',
        color: AppColors.white,
        height: 20,
      ),
    );
  }
}
