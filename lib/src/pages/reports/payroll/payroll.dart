import 'package:client/src/bloc/information/information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/information/information_model.dart';
import 'widget/card_payroll.dart';

class Payroll extends StatefulWidget {
  final List<InformationModel> data;
  final InformationBloc bloc;
  const Payroll({
    Key? key,
    required this.data,
    required this.bloc,
  }) : super(key: key);

  @override
  _PayrollState createState() => _PayrollState();
}

class _PayrollState extends State<Payroll> {
  List<InformationModel> information = [];
  @override
  void initState() {
    information = widget.bloc.informationList;
    print('tiene === ${widget.bloc.informationList}');
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<InformationBloc, InformationState>(
        bloc: widget.bloc,
        builder: (context, state) {
          return Column(
            children: [
              for (InformationModel item in information)
                CardPayroll(
                  image:
                      'https://ninjagoatnutrition.com/wp-content/uploads/2018/06/coffee-drinker.jpgg',
                  id: 'ID: 12345',
                  name: '${item.nombre1} ${item.nombre2} ${item.apellido1}',
                  description: 'No. Contrato : ',
                  date: item.fechaIngreso,
                ),
            ],
          );
        },
      );
}
