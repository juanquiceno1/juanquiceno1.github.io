import 'package:flutter/material.dart';

class ButtonOutLine extends StatefulWidget {
  final String description;
  final void Function()? onPressed;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final double? sizeText;
  const ButtonOutLine({
    Key? key,
    required this.description,
    required this.onPressed,
    this.paddingVertical,
    this.paddingHorizontal,
    this.sizeText,
  }) : super(key: key);

  @override
  State<ButtonOutLine> createState() => _ButtonOutLineState();
}

class _ButtonOutLineState extends State<ButtonOutLine> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onHover: ((value) {
        setState(() {
          onHover = value;
        });
      }),
      onPressed: widget.onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            vertical: widget.paddingVertical ?? 20.0,
            horizontal: widget.paddingHorizontal ?? 10.0,
          ),
        ),
        // mouseCursor:
        //     MaterialStateProperty.all<MouseCursor>(
        //   MouseCursor.uncontrolled,
        // ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: Theme.of(context).iconTheme.color ?? Colors.white,
          ),
        ),
      ),
      child: Center(
        child: Text(
          widget.description,
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
