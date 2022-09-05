import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app_bar_modal.dart';

class ModalGeneric extends StatelessWidget {
  final String? title;
  final Widget? widget;
  const ModalGeneric({
    Key? key,
    this.title,
    this.widget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(maxHeight: 80.h, minHeight: 30.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppBarModal(
              title: title ?? 'Seleccione',
            ),
            Flexible(
              child: SingleChildScrollView(
                child: widget ?? Container(),
              ),
            )
          ],
        ),
      );

  double elevation() {
    return 16.0;
  }

  RoundedRectangleBorder style() {
    return RoundedRectangleBorder(
      side: BorderSide(color: Colors.white, width: 1),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
    );
  }
}
