import 'package:flutter/material.dart';

import '../../../routes/navigation.dart';
import '../../../utils/theme/colors.dart';

class ReportRequestText extends StatelessWidget {
  const ReportRequestText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => navigateToRequestReport(context),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '¿No encuentras lo que necesitas?\n',
            style: Theme.of(context).primaryTextTheme.subtitle1,
            children: <TextSpan>[
              TextSpan(
                text: 'Solicita Informe Adicional',
                style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
        ),
      );
}
