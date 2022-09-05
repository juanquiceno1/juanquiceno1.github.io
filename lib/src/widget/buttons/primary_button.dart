import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String labelText;
  final bool isEnabled;
  final int size;
  final void Function()? onPressed;
  final String? asset;

  const PrimaryButton({
    Key? key,
    required this.labelText,
    required this.isEnabled,
    required this.size,
    required this.onPressed,
    this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: isEnabled ? onPressed : null,
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (asset != null)
              ImageIcon(
                AssetImage(
                  asset!,
                ),
                size: 30,
                color: AppColors.darkGrey,
              ),
            if (asset != null) SizedBox(width: 10),
            Text(
              labelText,
              textAlign: TextAlign.center,
              style: Theme.of(context).primaryTextTheme.button!.copyWith(
                    color: AppColors.white,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
