import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/theme/colors.dart';
import '../out_line_border.dart';

class TextFieldDrown2 extends StatefulWidget {
  final String description;
  final List<String> items;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  const TextFieldDrown2(
      {Key? key,
      required this.description,
      required this.items,
      this.onSaved,
      this.validator})
      : super(key: key);

  @override
  _TextFieldDrown2State createState() => _TextFieldDrown2State();
}

class _TextFieldDrown2State extends State<TextFieldDrown2> {
  // ignore: prefer_typing_uninitialized_variables
  var _item;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DropdownButtonFormField(
        items: widget.items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (newValue) {
          // do other stuff with _item
          setState(() => _item = newValue);
        },
        value: _item,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 16.sp,
        ),
        decoration: InputDecoration(
          fillColor: AppColors.darkGrey.withOpacity(0.1),
          hintStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16.sp,
          ),
          hintText: widget.description,
          alignLabelWithHint: true,
          filled: true,
          isDense: true,
          border: OutLineBorder().outline(50, 1, Colors.transparent),
          focusedBorder: OutLineBorder().outline(50, 1, Colors.transparent),
          disabledBorder: OutLineBorder().outline(50, 1, Colors.transparent),
          enabledBorder: OutLineBorder().outline(50, 1, Colors.transparent),
          focusedErrorBorder: OutLineBorder().outline(50, 1, Colors.red),
        ),
      );
}
