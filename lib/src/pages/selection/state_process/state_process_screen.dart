import 'package:client/src/routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/theme/colors.dart';
import '../../../widget/appbar/app_bar_back.dart';
import '../../../widget/cards/card_state_process.dart';
import '../../../widget/pop_up_menu/icon_description_popup_menu.dart';

class StateProcessScreen extends StatefulWidget {
  static const String routeName = 'state_process';
  const StateProcessScreen({Key? key}) : super(key: key);
  @override
  State<StateProcessScreen> createState() => _StateProcessScreenState();
}

class _StateProcessScreenState extends State<StateProcessScreen> {
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
              title: 'Estado del Proceso',
            ),
            _body(context)
          ],
        ),
      );

  _body(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            SizedBox(height: 15),
            // for (var item in items)
            CardStateProcess(
              reference: 'NO. REQ. 713',
              title: 'Analista de Credito',
              description: 'No. Vacantes : 1  •  Ibague',
              popMenu: _popUpMenu(context),
            ),
            CardStateProcess(
              reference: 'NO. REQ. 713',
              title: 'Mercaderista',
              description: 'No. Vacantes : 2  •  Tocancipa',
              popMenu: _popUpMenu(context),
            ),
            CardStateProcess(
              reference: 'NO. REQ. 713',
              title: 'Auxiliar de Laboratorio',
              description: 'No. Vacantes : 1  •  Ibague',
              popMenu: _popUpMenu(context),
            )
          ],
        ),
      );

  Widget _popUpMenu(BuildContext context) => PopupMenuButton(
        onSelected: (value) {
          switch (value) {
            case 3:
              navigateToProcessDetail(context);
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
            value: 1,
            child: IconDescriptionPopUpMenu(
              icon: Icons.check_circle_outline,
              description: 'Gestionar Candidatos',
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: IconDescriptionPopUpMenu(
              icon: Icons.list_alt_rounded,
              description: 'Observaciones Candidatos',
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: IconDescriptionPopUpMenu(
              icon: Icons.visibility_rounded,
              description: 'Detalle del Proceso',
            ),
          ),
          PopupMenuItem(
            value: 4,
            child: IconDescriptionPopUpMenu(
              icon: Icons.copy_rounded,
              description: 'Copiar Proceso',
            ),
          ),
          PopupMenuItem(
            value: 5,
            child: IconDescriptionPopUpMenu(
              icon: Icons.share_rounded,
              description: 'Compartir',
            ),
          ),
        ],
        child: Icon(
          Icons.more_vert_rounded,
          color: AppColors.darkGrey,
          size: 25,
        ),
      );
}
