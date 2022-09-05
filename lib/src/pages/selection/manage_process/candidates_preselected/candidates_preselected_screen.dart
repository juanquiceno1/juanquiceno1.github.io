import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/theme/colors.dart';
import '../../../../widget/appbar/app_bar_back.dart';
import '../../../../widget/cards/card_description_status.dart';
import '../../../../widget/pop_up_menu/icon_description_popup_menu.dart';
import '../../../../widget/text_field/style_underline/search_style.dart';

class CandidatesPreSelectedScreen extends StatefulWidget {
  static const String routeName = 'candidates_preselected';
  const CandidatesPreSelectedScreen({Key? key}) : super(key: key);

  @override
  _CandidatesPreSelectedScreenState createState() =>
      _CandidatesPreSelectedScreenState();
}

class _CandidatesPreSelectedScreenState
    extends State<CandidatesPreSelectedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            AppBarBack(
              title: 'Candidatos Preseleccionados',
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _search(context),
                  SizedBox(height: 30),
                  CardDescriptionStatus(
                    title: 'DISEÑADORA INDUSTRIAL',
                    image:
                        'https://ninjagoatnutrition.com/wp-content/uploads/2018/06/coffee-drinker.jpg',
                    name: 'Juliana Franco Restrepo',
                    location: 'Tocancipa',
                    date: DateTime(2021, 9, 7),
                    type: 1,
                    status: 'EN PROCESO CONTRATACION',
                    widget: _items(context),
                  ),
                  CardDescriptionStatus(
                    title: 'DISEÑADORA INDUSTRIAL',
                    image:
                        'https://ninjagoatnutrition.com/wp-content/uploads/2018/06/coffee-drinker.jpg',
                    name: 'Juliana Franco Restrepo',
                    location: 'Tocancipa',
                    date: DateTime(2021, 9, 7),
                    id: 'ID: 1452347',
                    type: 2,
                    status: 'CITAR',
                    widget: _items(context),
                  ),
                  CardDescriptionStatus(
                    title: 'DISEÑADORA INDUSTRIAL',
                    image:
                        'https://ninjagoatnutrition.com/wp-content/uploads/2018/06/coffee-drinker.jpg',
                    name: 'Juliana Franco Restrepo',
                    location: 'Tocancipa',
                    date: DateTime(2021, 9, 7),
                    id: 'Fecha de Ingreso : 24/04/21',
                    widget: _items(context),
                  )
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
                  // isSearch = true;
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

  Widget _items(BuildContext context) => PopupMenuButton(
        onSelected: (value) {},
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
              description: 'Documento Selección',
            ),
          ),
          PopupMenuItem(
            onTap: () {},
            value: 2,
            child: IconDescriptionPopUpMenu(
              icon: Icons.list_alt_rounded,
              description: 'Documento contratación',
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: IconDescriptionPopUpMenu(
              icon: Icons.visibility_rounded,
              description: 'Detalle Empleado',
            ),
          )
        ],
        child: Icon(
          Icons.more_vert_rounded,
          color: AppColors.darkGrey,
          size: 25,
        ),
      );
}
