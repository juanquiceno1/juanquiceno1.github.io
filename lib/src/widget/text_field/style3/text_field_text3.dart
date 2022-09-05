import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/theme/colors.dart';
import '../out_line_border.dart';

class TextFieldText3 extends StatefulWidget {
  final String? initialValue;
  final String description;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  final FocusNode focusNode;
  final FocusNode? focusNext;
  final AutovalidateMode? validateMode;
  final TextInputType? inputType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? inputAction;
  const TextFieldText3(
      {Key? key,
      required this.description,
      required this.focusNode,
      this.focusNext,
      this.onSaved,
      this.validator,
      this.inputAction,
      this.textCapitalization,
      this.inputType,
      this.validateMode,
      this.initialValue})
      : super(key: key);
  @override
  _TextFieldText3State createState() => _TextFieldText3State();
}

class _TextFieldText3State extends State<TextFieldText3> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller.text = widget.initialValue ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        focusNode: widget.focusNode,
        controller: _controller,
        readOnly: false,
        onTap: () {
          setState(() {
            FocusScope.of(context).unfocus();
            FocusScope.of(context).requestFocus(widget.focusNode);
          });
        },
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.sentences,
        obscureText: false,
        keyboardType: widget.inputType ?? TextInputType.text,
        textInputAction: widget.inputAction ?? TextInputAction.done,
        onFieldSubmitted: (value) {
          setState(() {
            if (widget.focusNext != null) {
              FocusScope.of(context).requestFocus(widget.focusNext);
            } else {
              FocusScope.of(context).unfocus();
            }
          });
        },
        style: TextStyle(color: Colors.black, fontSize: 16.sp),
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          labelText: widget.description,
          labelStyle: TextStyle(
            color: widget.focusNode.hasFocus
                ? AppColors.primaryColor
                : AppColors.darkGrey,
          ),
          hoverColor: Colors.grey,
          alignLabelWithHint: true,
          filled: true,
          isDense: true,
          border: OutLineBorder().lineinpunt(AppColors.darkGrey, 1.0, 15),
          focusedBorder:
              OutLineBorder().lineinpunt(AppColors.primaryColor, 1, 15),
          // focusedErrorBorder: OutLineBorder().lineinpunt(AppColors.red, 1, 15),
          // disabledBorder: OutLineBorder().outline(50, 1, Colors.green),
          // enabledBorder: OutLineBorder().outline(50, 1, Colors.green),
        ),
        autovalidateMode: widget.validateMode ?? AutovalidateMode.disabled,
        validator: widget.validator,
        onSaved: widget.onSaved,
      );
}
