import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/theme/colors.dart';
import '../out_line_border.dart';

class TextFieldText2 extends StatefulWidget {
  final String description;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  const TextFieldText2(
      {Key? key, required this.description, this.onSaved, this.validator})
      : super(key: key);
  @override
  _TextFieldText2State createState() => _TextFieldText2State();
}

class _TextFieldText2State extends State<TextFieldText2> {
  final TextEditingController _controller = TextEditingController();
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
        // focusNode: focus,
        controller: _controller,
        readOnly: false,
        textCapitalization: TextCapitalization.sentences,
        obscureText: false,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (value) {},
        style: TextStyle(color: AppColors.primaryColor, fontSize: 16.sp),
        cursorColor: Colors.green,
        decoration: InputDecoration(
            fillColor: AppColors.darkGrey.withOpacity(0.1),
            hintStyle:
                TextStyle(color: AppColors.primaryColor, fontSize: 16.sp),
            hintText: widget.description,
            hoverColor: Colors.grey,
            alignLabelWithHint: true,
            filled: true,
            isDense: true,
            border: OutLineBorder().outline(50, 1, Colors.transparent),
            focusedBorder: OutLineBorder().outline(50, 1, Colors.transparent),
            disabledBorder: OutLineBorder().outline(50, 1, Colors.transparent),
            enabledBorder: OutLineBorder().outline(50, 1, Colors.transparent),
            focusedErrorBorder: OutLineBorder().outline(50, 1, Colors.red)),
        validator: (value) {
          if (value!.isEmpty) {
            return '${widget.description} Requerido';
          } else {
            return null;
          }
        },
        onSaved: (value) {},
      );
}
