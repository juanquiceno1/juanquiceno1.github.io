import 'package:flutter/material.dart';

import '../../../utils/theme/colors.dart';

InputDecoration searchInputDecoration({
  required String icon,
  required String hintText,
  String? error,
}) =>
    InputDecoration(
      prefix: SizedBox(
        width: 20,
      ),
      suffixIcon: Padding(
        padding: EdgeInsets.all(18.0),
        child: Image.asset(icon),
      ),
      filled: true,
      hintText: hintText,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
        borderSide: BorderSide(
          color: AppColors.primaryColor.withOpacity(0.2),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
        borderSide: BorderSide(
          color: AppColors.primaryColor.withOpacity(0.5),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      errorText: error,
      hintStyle: TextStyle(color: AppColors.darkGrey),
      fillColor: AppColors.primaryColor.withOpacity(0.2),
    );
