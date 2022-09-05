import 'package:flutter/material.dart';

import '../../routes/navigation.dart';
import '../../widget/appbar/app_bar_back.dart';
import '../../widget/buttons/secondary_button.dart';
import '../../widget/loading/loading_logo.dart';
import '../../widget/text_field/style_underline/text_field_drown2.dart';
import '../../widget/text_field/style_underline/text_filter.dart';
import '../../widget/toast/toast_generic.dart';

class RequestReportScreen extends StatefulWidget {
  static const String routeName = 'request_report';
  const RequestReportScreen({Key? key}) : super(key: key);
  @override
  State<RequestReportScreen> createState() => _RequestReportScreenState();
}

class _RequestReportScreenState extends State<RequestReportScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _content(context),
        if (_isLoading) LoadingLogo(),
      ],
    ));
  }

  Widget _content(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            AppBarBack(
              title: 'Solicitud Informe',
            ),
            _body(context),
          ],
        ),
      );

  _body(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            SizedBox(height: 30),
            TextFilter(
              key: Key('Cargo'),
              description: 'Cargo',
            ),
            TextFieldDrown2(
              description: 'Seleccionar Cargo',
              items: const ['Producción', 'Transporte'],
            ),
            SizedBox(height: 20),
            TextFilter(
              key: Key('Ciudad'),
              description: 'Ciudad',
            ),
            TextFieldDrown2(
              description: 'Seleccionar la ciudad',
              items: const ['Bogotá', 'Tuluá', 'Cali', 'Medellín'],
            ),
            SizedBox(height: 20),
            TextFilter(
              key: Key('Horario'),
              description: 'Horario',
            ),
            TextFieldDrown2(
              description: 'Seleccionar horario',
              items: const [
                'Tiempo completo',
                'Medio tiempo',
                'por horas',
                'por evento'
              ],
            ),
            SizedBox(height: 20),
            TextFilter(
              key: Key('Salario'),
              description: 'Salario',
            ),
            TextFieldDrown2(
              description: 'Seleccionar salario',
              items: const [
                '0 - 980.000',
                '981.000- 2.000.000',
                '2.000.000 en adelante'
              ],
            ),
            SizedBox(height: 20),
            TextFilter(
              key: Key('Formación'),
              description: 'Formación',
            ),
            TextFieldDrown2(
              description: 'Seleccionar formación',
              items: const [
                'Ing industrial',
                'Ing sistemas',
                'Administrativo',
                'Obrero'
              ],
            ),
            SizedBox(height: 20),
            TextFilter(
              key: Key('Experiencia'),
              description: 'Experiencia',
            ),
            TextFieldDrown2(
              description: 'Seleccionar experiencia',
              items: const ['1 - 2 Años', '2 - 4 años', '5 - 10 años'],
            ),
            SizedBox(height: 50),
            SecondaryButton(
              labelText: 'Solicitar',
              isEnabled: true,
              size: 100,
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 3))
                    .then((value) => {
                          setState(() {
                            _isLoading = false;
                          }),
                          navigatePop(context, true),
                          ToastGeneric.success(
                              context,
                              'Solicitud enviada',
                              'Recibimos tu solicitud de informe, pronto enviaremos lo que solicitas',
                              4)
                        });
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      );
}
