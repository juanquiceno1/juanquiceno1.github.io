import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../utils/theme/colors.dart';
import '../../../../../widget/appbar/app_bar_back.dart';
import '../../../../../widget/buttons/secondary_button.dart';
import '../../../../../widget/graphs/graph_circular.dart';

class CandidateProcessDetailScreen extends StatefulWidget {
  static const String routeName = 'candidate_process_detail';
  const CandidateProcessDetailScreen({Key? key}) : super(key: key);
  @override
  State<CandidateProcessDetailScreen> createState() =>
      _CandidateProcessDetailScreenState();
}

class _CandidateProcessDetailScreenState
    extends State<CandidateProcessDetailScreen> {
  List<Map<String, dynamic>> data = [
    {
      'title': 'Agendar Entrevista',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'status': 1
    },
    {
      'title': 'Agendar Entrevista',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'status': 1
    },
    {
      'title': 'Agendar Entrevista',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'status': 0
    },
    {
      'title': 'Agendar Entrevista',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'status': 0
    }
  ];
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
    return Scaffold(body: _content(context));
  }

  _content(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            AppBarBack(
              title: 'Detalle Proceso Candidato',
            ),
            SizedBox(height: 10),
            _body(context)
          ],
        ),
      );

  Widget _body(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Juliana Franco Restrepo',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subtitle1!
                            .copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Diseñadora Industrial',
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'ID : 12345678',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText2!
                            .copyWith(
                              fontSize: 14.sp,
                            ),
                      )
                    ],
                  ),
                ),
                GraphCircular(
                  progressInt: 30,
                  diameter: 25.w,
                  descriptionProgress: '30%',
                  // fontZisedProg: 16.sp,
                  colorActive: AppColors.primaryColor,
                  colorOff: AppColors.green10,
                  strokeWidth: 8,
                ),
              ],
            ),
            SizedBox(height: 30),
            for (var i = 0; i < data.length; i++)
              if (i == data.length - 1)
                //true, 0,
                //true afirma que es el ultimo valor
                //0 que no hay mas items para pintar la linea que los une
                _status(context, data[i], true, 0)
              //false, data[i+1]['status'],
              //"false" para decir que no es el ultimo
              //data[i+1]['status']  enviamos el status del siguiente item para activar la linea que los une
              else
                _status(context, data[i], false, data[i + 1]['status']),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Observaciones',
                style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                      fontSize: 14.sp,
                    ),
              ),
            ),
            SizedBox(height: 50),
            SecondaryButton(
              labelText: 'CONTRATAR',
              isEnabled: true,
              size: 80,
              onPressed: () {},
            ),
            SizedBox(height: 20),
            SecondaryButton(
                labelText: 'NO APROBADO',
                isEnabled: true,
                size: 80,
                onPressed: () {}),
            SizedBox(height: 100),
          ],
        ),
      );

  Widget _status(BuildContext context, Map<String, dynamic> item, bool end,
          int nextStatus) =>
      Container(
        height: 13.h,
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                if (!end)
                  Container(
                    height: 13.h,
                    width: 2,
                    margin: EdgeInsets.only(top: 13),
                    decoration: BoxDecoration(
                      color: nextStatus == 1
                          ? AppColors.primaryColor
                          : AppColors.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                Container(
                  height: 13,
                  width: 13,
                  decoration: BoxDecoration(
                    color: nextStatus == 1 || item['status'] == 1
                        ? AppColors.primaryColor
                        : AppColors.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style:
                        Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    item['description'],
                    style:
                        Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                              fontSize: 14.sp,
                            ),
                  )
                ],
              ),
            ),
            SizedBox(width: 5),
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.primaryColor,
                size: 24,
              ),
            )
          ],
        ),
      );
}
