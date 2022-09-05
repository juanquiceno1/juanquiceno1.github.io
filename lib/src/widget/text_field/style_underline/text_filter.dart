import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/theme/colors.dart';

class TextFilter extends StatelessWidget {
  final AlignmentGeometry? align;
  final String description;
  final double? size;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  const TextFilter(
      {Key? key,
      this.align,
      required this.description,
      this.size,
      this.onSaved,
      this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Align(
        alignment: align ?? Alignment.centerLeft,
        child: Text(
          description,
          style: TextStyle(
            fontSize: size ?? 16.sp,
            color: AppColors.darkGrey,
          ),
        ),
      );
}
