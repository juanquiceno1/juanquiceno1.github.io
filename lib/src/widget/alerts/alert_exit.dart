import 'package:flutter/material.dart';
import '../../routes/navigation.dart';

class AlertExit extends StatelessWidget {
  const AlertExit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      titleTextStyle: TextStyle(
        fontSize: 20,
        // color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      title: Text(
        '¿Seguro quieres salir de la aplicación?',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => navigatePop(context, true),
          child: Text('Salir'),
        ),
        TextButton(
          onPressed: () => navigatePop(context, false),
          child: Text('Cancelar'),
        )
      ],
    );
  }
}
