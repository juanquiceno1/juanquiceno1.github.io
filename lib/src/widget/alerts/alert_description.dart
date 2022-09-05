import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../buttons/primary_button.dart';
import '../buttons/secondary_button.dart';

class AlertDescription extends StatelessWidget {
  final String title;
  final String descriptionSucces;
  final VoidCallback succes;
  final String? content;
  final String? descriptionCancel;
  final VoidCallback? cancel;
  const AlertDescription(
      {Key? key,
      required this.title,
      required this.descriptionSucces,
      required this.succes,
      this.descriptionCancel,
      this.cancel,
      this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      titleTextStyle: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (content != null)
            Text(
              content!,
              style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                    fontSize: 15.sp,
                  ),
            ),
        ],
      ),
      actions: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: PrimaryButton(
              labelText: descriptionSucces,
              onPressed: succes,
              isEnabled: true,
              size: 100,
            )),
        if (descriptionCancel != null)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: SecondaryButton(
              labelText: '$descriptionCancel',
              onPressed: cancel,
              isEnabled: true,
              size: 100,
            ),
          ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
