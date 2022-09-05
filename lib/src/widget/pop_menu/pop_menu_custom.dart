import 'package:flutter/material.dart';

import '../../utils/theme/colors.dart';

class PopMenuCustom extends StatelessWidget {
  const PopMenuCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      tooltip: 'Opciones',
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
    );
  }
}
