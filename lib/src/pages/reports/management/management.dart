import 'package:client/src/bloc/information/information_bloc.dart';
import 'package:flutter/material.dart';

import '../../../routes/navigation.dart';
import '../../../widget/cards/card_description.dart';
import '../widget/report_request_text.dart';

class Management extends StatelessWidget {
  final InformationBloc informationBloc;
  const Management({Key? key, required this.informationBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          CardDescription(
            icon: 'assets/icon/report.png',
            description: 'Informe de Gestión',
            onPress: () {
              // navigateToDetailOtherReport(
              //     context, reportBloc, 'Informe de Gestión', 0);
            },
          ),
          CardDescription(
            icon: 'assets/icon/active-contracts.png',
            description: 'Contratos Activos',
            onPress: () {
              navigateToDetailOtherReport(
                  context, informationBloc, 'Contratos Activos', 3);
            },
          ),
          CardDescription(
            icon: 'assets/icon/retired-contracts.png',
            description: 'Contratos Retirados',
            onPress: () {
              navigateToDetailOtherReport(
                  context, informationBloc, 'Contratos Retirados', 2);
            },
          ),
          CardDescription(
            icon: 'assets/icon/entry.png',
            description: 'Ingresos Por Periodo',
            onPress: () {},
          ),
          CardDescription(
            icon: 'assets/icon/absenteeism.png',
            description: 'Informe de Ausentismo',
            onPress: () {
              navigateToDetailOtherReport(
                  context, informationBloc, 'Informe de Ausentismo', 4);
            },
          ),
          SizedBox(height: 30),
          ReportRequestText(),
          SizedBox(
            height: 60,
          ),
        ],
      );
}
