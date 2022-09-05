import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuSecundary extends StatefulWidget {
  final String descriptionOne;
  final VoidCallback tapOne;
  final String descriptionTwo;
  final VoidCallback tapTwo;
  final bool option;

  const MenuSecundary(
      {Key? key,
      required this.descriptionOne,
      required this.tapOne,
      required this.descriptionTwo,
      required this.tapTwo,
      required this.option})
      : super(key: key);
  @override
  State<MenuSecundary> createState() => _MenuSecundaryState();
}

class _MenuSecundaryState extends State<MenuSecundary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.h),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(50)),
      child: Row(children: [
        Expanded(
          child: GestureDetector(
            onTap: widget.tapOne,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                  color: widget.option ? Colors.green : Colors.grey[100],
                  borderRadius: BorderRadius.circular(50)),
              child: AutoSizeText(
                widget.descriptionOne,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: widget.option ? Colors.white : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: widget.tapTwo,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                  color: !widget.option ? Colors.green : Colors.grey[100],
                  borderRadius: BorderRadius.circular(50)),
              child: AutoSizeText(
                widget.descriptionTwo,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: !widget.option ? Colors.white : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
