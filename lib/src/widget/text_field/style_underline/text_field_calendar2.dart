import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/theme/colors.dart';
import '../out_line_border.dart';

class TextFieldCalendar2 extends StatefulWidget {
  final String description;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  const TextFieldCalendar2({
    Key? key,
    required this.description,
    this.onSaved,
    this.validator,
    required this.firstDate,
    required this.lastDate,
    required this.initialDate,
    this.onChanged,
  }) : super(key: key);
  @override
  _TextFieldCalendar2State createState() => _TextFieldCalendar2State();
}

class _TextFieldCalendar2State extends State<TextFieldCalendar2> {
  final ThemeData theme = ThemeData();
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    print(
        '${widget.initialDate.day}/${widget.initialDate.month}/${widget.initialDate.year}');
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DateTimePicker(
        type: DateTimePickerType.date,
        locale: Locale('es', 'ES'),
        dateMask: 'dd/MM/yyyy',
        // dateMask: 'd - MMMM - yyyy - hh:mm a',
        use24HourFormat: true,
        initialDate: widget.initialDate,
        firstDate: DateTime(
            widget.firstDate.year, widget.firstDate.month, widget.lastDate.day),
        lastDate: widget.lastDate,
        // icon: Icon(Icons.event),
        dateLabelText:
            '${widget.initialDate.day}/${widget.initialDate.month}/${widget.initialDate.year}',
        // timeLabelText: 'Hora límite',
        style: TextStyle(color: AppColors.primaryColor, fontSize: 16.sp),
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
            fillColor: AppColors.darkGrey.withOpacity(0.1),
            hintStyle:
                TextStyle(color: AppColors.primaryColor, fontSize: 16.sp),
            hintText:
                '${widget.initialDate.day}/${widget.initialDate.month}/${widget.initialDate.year}', //widget.description,
            alignLabelWithHint: true,
            filled: true,
            isDense: true,
            border: OutLineBorder().outline(50, 1, Colors.transparent),
            focusedBorder: OutLineBorder().outline(50, 1, Colors.transparent),
            disabledBorder: OutLineBorder().outline(50, 1, Colors.transparent),
            enabledBorder: OutLineBorder().outline(50, 1, Colors.transparent),
            focusedErrorBorder: OutLineBorder().outline(50, 1, Colors.red)),
        timePickerEntryModeInput: false,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
      );
}
