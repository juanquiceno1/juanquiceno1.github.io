import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../routes/navigation.dart';
import '../../../utils/theme/colors.dart';
import '../../../widget/appbar/app_bar_back.dart';
import '../../../widget/buttons/secondary_button.dart';
import '../../../widget/cards/card_description_status.dart';
import '../../../widget/cards/card_icon_descrition_button.dart';
import '../../../widget/pop_up_menu/icon_description_popup_menu.dart';
import '../../../widget/text_field/style_underline/search_style.dart';

class ManageProcessScreen extends StatefulWidget {
  static const String routeName = 'manage_process';
  const ManageProcessScreen({Key? key}) : super(key: key);

  @override
  _ManageProcessScreenState createState() => _ManageProcessScreenState();
}

class _ManageProcessScreenState extends State<ManageProcessScreen> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isSearch) {
          FocusScope.of(context).unfocus();
          setState(() {
            isSearch = false;
          });
          return false;
        } else {
          navigatePop(context, true);
          return true;
        }
      },
      child: Scaffold(
        body: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            AppBarBack(
              title: isSearch ? 'Gestionar Candidatos' : 'Gestiona Tu Proceso',
              onBack: isSearch
                  ? () {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        isSearch = false;
                      });
                    }
                  : () => navigatePop(context, true),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _search(context),
                  SizedBox(height: 20),
                  if (isSearch) _isSearch(context) else _body(context)
                ],
              ),
            )
          ],
        ),
      );

  Widget _search(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            height: 60,
            child: TextField(
              onTap: () {
                setState(() {
                  isSearch = true;
                });
              },
              decoration: searchInputDecoration(
                icon: 'assets/icon/search.png',
                hintText: 'Nombre Empleado o Cedula',
              ),
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage('assets/icon/filter.png'),
              color: AppColors.primaryColor,
            ),
          )
        ],
      );

  Widget _body(BuildContext context) => Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconDescriptionButton(
                onPress: () => navigateToCandidatesPreSelected(context),
                description: 'Candidatos Preseleccionados',
                icon: 'assets/icon/candidates.png',
              ),
              IconDescriptionButton(
                onPress: () => navigateToScheduleAppointment(context),
                description: 'Citar\nCandidatos',
                icon: 'assets/icon/cite-candidates.png',
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconDescriptionButton(
                onPress: () => navigateToHired(context),
                description: 'Mis\nContratados',
                icon: 'assets/icon/amy-contracts.png',
              ),
              IconDescriptionButton(
                onPress: () {},
                description: 'Examenes Medicos',
                icon: 'assets/icon/medical-exams.png',
              ),
            ],
          ),
          SizedBox(height: 40),
          SecondaryButton(
              asset: 'assets/icon/check.png',
              labelText: 'APROBACIÓN CANDIDATOS',
              isEnabled: true,
              size: 80,
              onPressed: () {})
        ],
      );

  Widget _isSearch(BuildContext context) => Column(
        children: [
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '2 Candidatos Encontrados',
              style: Theme.of(context).primaryTextTheme.subtitle1,
              // style: TextStyle(color: AppColors.darkGrey, fontSize: 12.sp),
            ),
          ),
          SizedBox(height: 20),
          CardDescriptionStatus(
              title: 'ID: 12345678',
              image:
                  'https://ninjagoatnutrition.com/wp-content/uploads/2018/06/coffee-drinker.jpg',
              name: 'Juliana Franco Restrepo',
              location: 'Movil: 12998534',
              date: DateTime(2021, 9, 7),
              // id: 'Fecha de Ingreso : 24/04/21',
              status: 'EN PROCESO CONTRATACION',
              type: 1,
              widget: _items(context)),
          CardDescriptionStatus(
              title: 'ID: 12345678',
              image:
                  'https://ninjagoatnutrition.com/wp-content/uploads/2018/06/coffee-drinker.jpg',
              name: 'Juliana Franco Restrepo',
              location: 'Movil: 12998534',
              date: DateTime(2021, 9, 7),
              // id: 'Fecha de Ingreso : 24/04/21',
              status: 'CITAR',
              type: 2,
              widget: _items(context))
        ],
      );

  Widget _items(BuildContext context) => PopupMenuButton(
        onSelected: (value) {
          switch (value) {
            case 5:
              navigateToCandidateProcessDetail(context);
              break;
          }
        },
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.transparent,
            )),
        itemBuilder: (context) => [
          PopupMenuItem(
            onTap: () {},
            value: 1,
            child: IconDescriptionPopUpMenu(
              icon: Icons.check_circle_outline,
              description: 'Observaciones',
            ),
          ),
          PopupMenuItem(
            onTap: () {},
            value: 2,
            child: IconDescriptionPopUpMenu(
              icon: Icons.list_alt_rounded,
              description: 'Citar',
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: IconDescriptionPopUpMenu(
              icon: Icons.visibility_rounded,
              description: 'Contratar',
            ),
          ),
          PopupMenuItem(
            value: 4,
            child: IconDescriptionPopUpMenu(
              icon: Icons.cancel_outlined,
              description: 'NO Aprobado',
            ),
          ),
          PopupMenuItem(
            value: 5,
            child: IconDescriptionPopUpMenu(
              icon: Icons.visibility_rounded,
              description: 'Detalle Proceso Candidato',
            ),
          )
        ],
        child: Icon(
          Icons.more_vert_rounded,
          color: AppColors.darkGrey,
          size: 30,
        ),
      );
}
