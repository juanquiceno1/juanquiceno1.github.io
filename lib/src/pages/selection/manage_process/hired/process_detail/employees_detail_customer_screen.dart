import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../widget/appbar/app_bar_back.dart';
import '../../../../../widget/buttons/secondary_button.dart';
import '../../../../../widget/cards/card_account_executive.dart';
import '../../../../../widget/toast/toast_generic.dart';

class EmployeesDetailScreen extends StatefulWidget {
  static const String routeName = 'employees_detail';
  const EmployeesDetailScreen({Key? key}) : super(key: key);
  @override
  State<EmployeesDetailScreen> createState() => _EmployeesDetailScreenState();
}

class _EmployeesDetailScreenState extends State<EmployeesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _content(context));
  }

  Widget _content(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            AppBarBack(
              title: 'Detalle Empleados',
            ),
            SizedBox(height: 30),
            CardAccountExecutive(
              image:
                  'https://ninjagoatnutrition.com/wp-content/uploads/2018/06/coffee-drinker.jpg',
              child: _data(context),
            ),
          ],
        ),
      );

  Widget _data(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Julian Franco Restrepo',
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(child: _description('INGRESO: ', '10/09/21')),
                SizedBox(width: 10),
                Expanded(child: _description('VENCE: ', '01/04/21'))
              ],
            ),
            SizedBox(height: 20),
            _description('ESTADO: ', 'ACTIVO'),
            SizedBox(height: 20),
            _description('CARGO: ', 'OPERARIO'),
            SizedBox(height: 20),
            _description('SALARIO: ', '908526'),
            SizedBox(height: 20),
            _description('EPS: ', 'NUEVA EPS S.A.'),
            SizedBox(height: 20),
            _description('AFP: ', 'COLPENSIONES'),
            SizedBox(height: 20),
            _description('CCF: ', 'FAMILIAR DE NARIÑO'),
            SizedBox(height: 20),
            _description('ARL: ', 'SURA'),
            SizedBox(height: 50),
            SecondaryButton(
              labelText: 'CERTIFICADO LABORAL',
              isEnabled: true,
              size: 100,
              onPressed: () async {
                ToastGeneric.success(context, 'CERTIFICADO LABORAL',
                    'CERTIFICADO LABORAL'.toLowerCase(), 5);
              },
            ),
            SizedBox(
              height: 20,
            ),
            SecondaryButton(
              labelText: 'CERTIFICADO ING Y RETENCIONES',
              isEnabled: true,
              size: 100,
              onPressed: () async {
                ToastGeneric.success(context, 'CERTIFICADO ING Y RETENCIONES',
                    'CERTIFICADO ING Y RETENCIONES'.toLowerCase(), 5);
              },
            ),
            SizedBox(
              height: 20,
            ),
            SecondaryButton(
              labelText: 'VOLANTE DE PAGO',
              isEnabled: true,
              size: 100,
              onPressed: () async {
                ToastGeneric.success(context, 'VOLANTE DE PAGO',
                    'VOLANTE DE PAGO'.toLowerCase(), 5);
              },
            ),
            SizedBox(
              height: 20,
            ),
            SecondaryButton(
              labelText: 'VER PAGO SS',
              isEnabled: true,
              size: 100,
              onPressed: () async {
                ToastGeneric.success(
                    context, 'VER PAGO SS', 'VER PAGO SS'.toLowerCase(), 5);
              },
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      );

  Widget _description(String title, String description) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                        fontSize: 14.sp,
                      ),
                ),
              ),
              Text(
                description,
                style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
          Divider()
        ],
      );
}
