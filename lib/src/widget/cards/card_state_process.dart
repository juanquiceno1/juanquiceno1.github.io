import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/lang/initial_title.dart';
import '../../utils/theme/colors.dart';
import 'card_initial_yellow.dart';

class CardStateProcess extends StatefulWidget {
  final String reference;
  final String title;
  final String description;
  final String? id;
  final int? type;
  final String? status;
  final Widget popMenu;
  const CardStateProcess(
      {Key? key,
      required this.reference,
      required this.title,
      required this.description,
      this.id,
      this.type,
      this.status,
      required this.popMenu})
      : super(key: key);

  @override
  State<CardStateProcess> createState() => _CardStateProcessState();
}

class _CardStateProcessState extends State<CardStateProcess> {
  String initial = '';

  @override
  void initState() {
    initial = InitialTitle().initial(widget.title);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardInitialYellow(description: initial),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.reference,
                    style:
                        Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                              fontSize: 16.sp,
                            ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    widget.title,
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                  SizedBox(height: 3),
                  Text(
                    widget.description,
                    style:
                        Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                              fontSize: 13.sp,
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
            widget.popMenu
          ],
        ),
      );
}
