import 'package:flutter/material.dart';

import '../../models/notification/notification_model.dart';
import '../../utils/theme/colors.dart';
import '../../widget/appbar/app_bar_back.dart';
import '../../widget/cards/card_notifications.dart';

class NotificationsScreen extends StatefulWidget {
  static const String routeName = 'notification_screen';
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final onDetailProcess = ValueNotifier<bool>(false);

  NotificationsModel notification = NotificationsModel.fromJson({});

  @override
  void initState() {
    notification.notifications = [
      NotificationModel.fromJson({}),
      NotificationModel.fromJson({}),
      NotificationModel.fromJson({}),
      NotificationModel.fromJson({}),
    ];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: AppColors.primaryColor.withOpacity(0.1),
        child: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) => SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: AppBarBack(
                  title: 'Notificaciones',
                  // size: 18.sp,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: _listOffers,
              ),
            ],
          ),
        ),
      );

  Widget get _listOffers => ListView.builder(
        itemCount: notification.notifications.length,
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return CardNotifications(
            data: notification.notifications.elementAt(index),
            onTap: () {
              setState(
                () {
                  notification.notifications.elementAt(index).status =
                      !notification.notifications.elementAt(index).status;
                },
              );
            },
          );
        },
      );
}
