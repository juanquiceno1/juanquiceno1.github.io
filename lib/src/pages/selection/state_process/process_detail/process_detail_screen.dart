import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../utils/lang/initial_title.dart';
import '../../../../utils/theme/colors.dart';
import '../../../../widget/appbar/app_bar_back.dart';
import '../../../../widget/cards/card_initial_yellow.dart';
import '../../../../widget/menu/menu_secundary.dart';
import '../../../reports/headcount/widgets/age_range.dart';
import '../../../reports/headcount/widgets/gender.dart';

class ProcessDetailScreen extends StatefulWidget {
  static const String routeName = 'process_detail';
  const ProcessDetailScreen({Key? key}) : super(key: key);
  @override
  State<ProcessDetailScreen> createState() => _ProcessDetailScreenState();
}

class _ProcessDetailScreenState extends State<ProcessDetailScreen> {
  bool option = true;

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

  Widget _content(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            AppBarBack(
                title: 'Detalle del Proceso',
                onOption: IconButton(
                  onPressed: () {
                    Share.share('Compartiendo desde proservis',
                        subject: 'Hola');
                  },
                  icon: Icon(
                    Icons.share_rounded,
                    color: AppColors.primaryColor,
                  ),
                )),
            SizedBox(height: 20),
            _body(context)
          ],
        ),
      );

  Widget _body(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tiempo completo'.toUpperCase(),
                        style: Theme.of(context)
                            .primaryTextTheme
                            .bodyText2!
                            .copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Analista de Crédito',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subtitle1!
                            .copyWith(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Ibague',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subtitle1!
                            .copyWith(
                                fontSize: 16.sp,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle1
                                    ?.color
                                    ?.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ),
                CardInitialYellow(
                  description: InitialTitle().initial('Analista de Crédito'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\$908.526 / Mensual',
                style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                      fontSize: 15.sp,
                    ),
              ),
            ),
            SizedBox(height: 20),
            MenuSecundary(
              option: option,
              descriptionOne: 'Estadísticas',
              tapOne: () {
                setState(() => option = true);
              },
              descriptionTwo: 'Descripción Laboral',
              tapTwo: () {
                setState(() => option = false);
              },
            ),
            SizedBox(height: 30),
            if (option) _statistics() else _jobDescription()
          ],
        ),
      );

  Widget _statistics() => Column(
        children: const [
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Text(
          //     'Hojas de Vida Recibidas',
          //     style: TextStyle(
          //       fontSize: 12.sp,
          //       color: AppColors.darkGrey,
          //     ),
          //   ),
          // ),
          // SizedBox(height: 5),
          // Divider(),
          SizedBox(height: 15),
          Gender(
            men: '47.1',
            women: '52.2',
            type: 'T',
          ),
          // Wrap(
          //   spacing: 5,
          //   runAlignment: WrapAlignment.spaceEvenly,
          //   children: [
          //     GraphCircular(
          //       progressInt: 54,
          //       descriptionProgress: '54.5%',
          //       description: 'Hombres',
          //       colorActive: AppColors.primaryColor,
          //       colorOff: AppColors.primaryColor.withOpacity(0.3),
          //     ),
          //     GraphCircular(
          //       progressInt: 45,
          //       descriptionProgress: '45.5%',
          //       description: 'Mujeres',
          //       colorActive: AppColors.yellow2,
          //       colorOff: AppColors.yellow2.withOpacity(0.3),
          //     )
          //   ],
          // ),
          SizedBox(height: 40),
          // Divider(),
          // SizedBox(height: 15),
          AgeRange(
            ageRange: [],
            length: 0,
          ),
          // Container(
          //   height: 20.h,
          //   width: 100.w,
          //   alignment: Alignment.center,
          //   color: Colors.transparent,
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Align(
          //           alignment: Alignment.bottomLeft,
          //           child: Text(
          //             'Años',
          //             style:
          //                 TextStyle(color: AppColors.darkGrey, fontSize: 11.sp),
          //           ),
          //         ),
          //         SizedBox(
          //           width: 10,
          //         ),
          //         GraphLinear(
          //           amount: 30,
          //           total: 53,
          //           description: '(12-29)',
          //           isVertical: true,
          //         ),
          //         GraphLinear(
          //           amount: 15,
          //           total: 53,
          //           description: '(30-39)',
          //           isVertical: true,
          //         ),
          //         GraphLinear(
          //           amount: 5,
          //           total: 53,
          //           description: '(40-49)',
          //           isVertical: true,
          //         ),
          //         GraphLinear(
          //           amount: 2,
          //           total: 53,
          //           description: '50-60',
          //           isVertical: true,
          //         ),
          //         GraphLinear(
          //           amount: 1,
          //           total: 53,
          //           description: '+61',
          //           isVertical: true,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(height: 15),
          // DescriptionGraphAge(),
          SizedBox(height: 100),
        ],
      );

  Widget _jobDescription() => Column(
        children: const [
          Text(
              'Lorem ipsum dolor sit amet. Ea magni Quis qui sapiente alias et animi vitae ut aspernatur obcaecati! Et explicabo placeat est repudiandae delectus cum impedit enim.')
        ],
      );
}
