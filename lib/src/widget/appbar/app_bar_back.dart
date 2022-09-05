import 'package:flutter/material.dart';

import '../../routes/navigation.dart';
import '../../utils/theme/colors.dart';

class AppBarBack extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final Widget? onOption;
  final TextAlign? textAlign;
  final double? size;
  const AppBarBack({
    Key? key,
    required this.title,
    this.onBack,
    this.onOption,
    this.textAlign,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (Navigator.canPop(context))
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: onBack ?? () => navigatePop(context, true),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ),

              // SizedBox(width: 2),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                  textAlign: textAlign ?? TextAlign.center,
                ),
              ),
              onOption ??
                  PopupMenuButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Text('Política de Datos'),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text('Ayuda'),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text(
                          'Cerrar Sesion',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      )
                    ],
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.more_vert_rounded,
                        color: AppColors.primaryColor,
                        size: 30,
                      ),
                    ),
                  )
            ],
          ),
        ),
      );
}
