import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../utils/theme/colors.dart';

enum ToastAction {
  success,
  error,
  info,
  warning,
}

class ToastGeneric {
  static success(
      BuildContext context, String title, String description, int time) {
    MotionToast.success(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(
        description,
      ),
      toastDuration: Duration(seconds: time),
      dismissable: true,
    ).show(context);
  }

  static toast(
      {required BuildContext context,
      required FToast fToast,
      ToastAction? toastAction,
      IconData? icon,
      required String description,
      int? tiempoToast}) {
    Widget toast = FadeInUp(
        delay: Duration(milliseconds: 400),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: toastAction == null
                ? Color.fromARGB(255, 57, 57, 57)
                : toastAction == ToastAction.success
                    ? AppColors.green
                    : toastAction == ToastAction.error
                        ? AppColors.red
                        : toastAction == ToastAction.warning
                            ? Color.fromARGB(255, 255, 199, 59)
                            : Color.fromARGB(255, 57, 57, 57),
          ),
          child: icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    SizedBox(width: 12.0),
                    Flexible(
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : Text(
                  description,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
        ));
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(
        seconds: tiempoToast ?? 3,
      ),
    );
  }

  static error({
    required BuildContext context,
    String? title,
    String? description,
    int? time,
  }) {
    MotionToast.error(
      title: Text(
        title ?? '',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(
        description ?? '',
      ),
      toastDuration: Duration(seconds: time ?? 3),
      dismissable: true,
    ).show(context);
  }

  static warning(
      BuildContext context, String title, String description, int time) {
    MotionToast.warning(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: Text(
        description,
      ),
      toastDuration: Duration(seconds: time),
      dismissable: true,
    ).show(context);
  }
}
