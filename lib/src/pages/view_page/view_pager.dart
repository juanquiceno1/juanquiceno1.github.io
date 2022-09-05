import 'package:client/src/bloc/account_executive/account_executive_bloc.dart';
import 'package:client/src/bloc/contact/contact_bloc.dart';
import 'package:client/src/pages/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../bloc/information/information_bloc.dart';
import '../../routes/navigation.dart';
import '../../utils/lang/get_icon_navbar.dart';
import '../../utils/preferences/preferences_user.dart';
import '../../utils/theme/colors.dart';
import '../../widget/alerts/alert_description.dart';
import '../dashboard/dashboard_screen.dart';
import '../notifications/notifications_screen.dart';
import '../reports/reports_screen.dart';
import '../selection/selection_screen.dart';

class ViewPagerScreen extends StatefulWidget {
  static const String routeName = 'view_page';

  const ViewPagerScreen({Key? key}) : super(key: key);

  @override
  _ViewPagerScreenState createState() => _ViewPagerScreenState();
}

final selectedIndex = ValueNotifier<int>(2);

class _ViewPagerScreenState extends State<ViewPagerScreen> {
  DashboardBloc dashboardBloc = DashboardBloc();
  InformationBloc informationBloc = InformationBloc();
  ContactBloc contacBloc = ContactBloc();
  AccountExecutiveBloc accountExecutiveBloc = AccountExecutiveBloc();
  List<Widget> _widgetOptions = <Widget>[];
  @override
  void initState() {
    _widgetOptions = [
      Center(),
      NotificationsScreen(),
      DashBoardScreen(
        dashboardbloc: dashboardBloc,
        accountExecutiveBloc: accountExecutiveBloc,
        contactBloc: contacBloc,
      ),
      ReportsScreen(
        informationBloc: informationBloc,
      ),
      SelectionScreen(),
    ];
    dashboardBloc.add(DashboardUserEvent());
    informationBloc.add(InformationDataEvent());
    // contacBloc.add(ContactGetDataEvent());
    super.initState();
  }

  @override
  void dispose() {
    dashboardBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: selectedIndex,
        builder: (context, value, _) {
          return WillPopScope(
            onWillPop: () async {
              if (value == 2) {
                return await showDialog(
                  context: context,
                  builder: (context) => AlertDescription(
                    title: '¿Seguro quieres salir de la aplicación?',
                    descriptionSucces: 'Salir',
                    succes: () => navigatePop(context, true),
                    descriptionCancel: 'Cancelar',
                    cancel: () => navigatePop(context, false),
                  ),
                );
              } else {
                setState(() {
                  selectedIndex.value = 2;
                });
                return false;
              }
            },
            child: Scaffold(
              body: _widgetOptions.elementAt(selectedIndex.value),
              bottomNavigationBar: _buttonNavigationBar,
            ),
          );
        });
  }

  Future<void> _onItemTapped(int index) async {
    if (index == 0) {
      await showDialog(
        context: context,
        builder: (context) => AlertDescription(
          title: '¿Seguro quieres cerrar sesión?',
          descriptionSucces: 'Cerrar sesión',
          succes: () {
            PreferencesUser().setToken = '';
            PreferencesUser().setDocument = '';
            PreferencesUser().setRoute = LoginScreen.routeName;
            navigateToLogin(context);
          },
          descriptionCancel: 'Cancelar',
          cancel: () => navigatePop(context, false),
        ),
      );
    } else {
      setState(() {
        selectedIndex.value = index;
      });
    }
  }

  Widget get _buttonNavigationBar => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: getIcon(0, selectedIndex.value),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: getIcon(1, selectedIndex.value),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: getIcon(2, selectedIndex.value),
            label: 'Tablero',
          ),
          BottomNavigationBarItem(
            icon: getIcon(3, selectedIndex.value, remplace: true),
            label: 'Informes',
          ),
          BottomNavigationBarItem(
            icon: getIcon(4, selectedIndex.value),
            label: 'Seleccion',
          ),
        ],
        currentIndex: selectedIndex.value,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.darkGrey,
        unselectedLabelStyle: TextStyle(color: AppColors.darkGrey),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      );
}
