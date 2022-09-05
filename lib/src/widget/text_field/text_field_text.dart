import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/theme/colors.dart';
import 'out_line_border.dart';

class TextFieldText extends StatefulWidget {
  final String description;
  final String? initialValue;
  final String? icon;
  final String? iconSuffix;
  final Color? iconColor;
  final bool? obscureText;
  final void Function(String?)? onSaved;
  final void Function(String?)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final Color? fillColor;
  final bool? readOnly;
  final FocusNode focusNode;
  final FocusNode? focusNext;
  final List<TextInputFormatter>? formatter;
  final AutovalidateMode? validateMode;
  final void Function()? onTap;
  final TextInputType? inputType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? inputAction;
  const TextFieldText({
    Key? key,
    required this.description,
    required this.focusNode,
    this.icon,
    this.validator,
    this.onSaved,
    this.fillColor,
    this.readOnly,
    this.focusNext,
    this.formatter,
    this.validateMode,
    this.onTap,
    this.inputType,
    this.textCapitalization,
    this.inputAction,
    this.iconColor,
    this.obscureText,
    this.onFieldSubmitted,
    this.iconSuffix,
    this.initialValue,
  }) : super(key: key);
  @override
  _TextFieldTextState createState() => _TextFieldTextState();
}

class _TextFieldTextState extends State<TextFieldText> {
  // final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        focusNode: widget.focusNode,
        // controller: _controller,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly ?? false,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.inputType ?? TextInputType.text,
        textInputAction: widget.inputAction ?? TextInputAction.done,
        onTap: widget.onTap ??
            () {
              setState(() {
                FocusScope.of(context).unfocus();
              });
            },
        onFieldSubmitted: widget.onFieldSubmitted ??
            (value) {
              setState(() {
                if (widget.focusNext != null) {
                  FocusScope.of(context).requestFocus(widget.focusNext);
                }
              });
            },
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
            fillColor: Colors.green[50],
            prefixIcon: widget.icon != null ? icon(true, widget.icon!) : null,
            prefixIconConstraints:
                widget.icon != null ? BoxConstraints(maxHeight: 35) : null,
            suffixIcon: widget.iconSuffix != null
                ? icon(false, widget.iconSuffix ?? '')
                : null,
            suffixIconConstraints: widget.iconSuffix != null
                ? BoxConstraints(maxHeight: 35)
                : null,
            labelText: widget.description,
            labelStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                color: widget.focusNode.hasFocus
                    ? AppColors.primaryColor
                    : Colors.grey,
              ),
            ),
            alignLabelWithHint: true,
            filled: true,
            isDense: false,
            border: OutLineBorder().outline(50, 1, AppColors.primaryColor),
            focusedBorder:
                OutLineBorder().outline(50, 1, AppColors.primaryColor),
            disabledBorder:
                OutLineBorder().outline(50, 1, AppColors.primaryColor),
            enabledBorder:
                OutLineBorder().outline(50, 1, AppColors.primaryColor),
            focusedErrorBorder:
                OutLineBorder().outline(50, 1, AppColors.primaryColor)),
        validator: widget.validator,
        onSaved: widget.onSaved,
      );

  Widget icon(bool active, String icon) {
    return Padding(
      padding: EdgeInsets.only(left: active ? 8 : 5, right: active ? 5 : 8),
      child: icon.contains('.svg')
          ? SvgPicture.asset(
              icon,
              // semanticsLabel: 'Icon',
              // color: widget.iconColor ?? Colors.green,
              height: 35,
            )
          : ImageIcon(
              AssetImage(icon),
              color: widget.iconColor ?? AppColors.primaryColor,
              size: 35,
            ),
    );
  }
}
