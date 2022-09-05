import 'package:client/src/bloc/account_executive/account_executive_bloc.dart';
import 'package:client/src/bloc/contact/contact_bloc.dart';
import 'package:client/src/bloc/dashboard/dashboard_bloc.dart';
import 'package:client/src/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/navigation.dart';
import '../../utils/theme/colors.dart';
import '../../widget/appbar/app_bar_description.dart';
import '../../widget/buttons/secondary_button.dart';
import '../../widget/cards/card_description.dart';
import '../../widget/cards/card_icon_descrition_button.dart';
import '../../widget/descriptions/name_bussines_image.dart';
import '../../widget/images/image_fade.dart';
import '../error/view_error.dart';
import '../view_page/view_pager.dart';

class DashBoardScreen extends StatefulWidget {
  static const String routeName = 'dashboard';
  final DashboardBloc dashboardbloc;
  final AccountExecutiveBloc accountExecutiveBloc;
  final ContactBloc contactBloc;
  const DashBoardScreen({
    Key? key,
    required this.dashboardbloc,
    required this.accountExecutiveBloc,
    required this.contactBloc,
  }) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  UserModel userModel = UserModel.fromJson({});
  bool isLoading = false;

  @override
  void initState() {
    userModel = widget.dashboardbloc.user;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: _content(context, screenSize),
    );
  }

  Widget _content(BuildContext context, Size screenSize) =>
      BlocBuilder<DashboardBloc, DashboardState>(
        bloc: widget.dashboardbloc,
        builder: (context, state) {
          if (state is Loading) {
            Future.delayed(Duration.zero, () {
              setState(() {
                isLoading = true;
              });
            });
          } else if (state is DashboardUserSuccess) {
            widget.dashboardbloc.add(DashboardInitialEvent());
            Future.delayed(Duration.zero, () {
              setState(() {
                userModel = state.user;
                isLoading = false;
              });
            });
          } else if (state is DashboardErrorState) {
            return ViewError(
              onPressed: () {
                widget.dashboardbloc.add(DashboardUserEvent());
              },
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                AppBarDescription(
                  title: 'Mi Tablero',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: NameBusinessImage(
                    loading: isLoading,
                    name: userModel.nombre,
                    business: userModel.cliente,
                    image:
                        'https://ninjagoatnutrition.com/wp-content/uploads/2018/06/coffee-drinker.jpg',
                  ),
                ),
                _body(context, screenSize)
              ],
            ),
          );
        },
      );

  Widget _body(BuildContext context, Size screenSize) => Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25),
            width: screenSize.width,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppColors.darkGrey.withOpacity(0.1),
                      blurRadius: 3.0,
                      offset: Offset(0.1, 0.1),
                      spreadRadius: 3.0)
                ]),
            child: _description(context),
          ),
          _image(context)
        ],
      );

  Widget _image(BuildContext context) => Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(right: 50),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: AppColors.darkGrey.withOpacity(0.1),
                    blurRadius: 3.0,
                    offset: Offset(0.1, 0.1),
                    spreadRadius: 3.0)
              ]),
          child: ImageFade(
            image:
                'https://yupi.com.co/wp-content/uploads/2016/05/historia-yupi.png',
          ),
        ),
      );

  Widget _description(BuildContext context) => Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconDescriptionButton(
                onPress: isLoading
                    ? null
                    : () {
                        selectedIndex.value = 3;
                      },
                description: 'Informes',
                icon: 'assets/images/information.png',
              ),
              IconDescriptionButton(
                onPress: () {
                  selectedIndex.value = 4;
                },
                description: 'Selección',
                icon: 'assets/images/selection.png',
              ),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CardDescription(
                    icon: 'assets/images/collaborators.png',
                    description: 'Mis Colaboradores',
                    onPress: () {
                      navigateToCollaborator(context);
                    }),
                CardDescription(
                    icon: 'assets/images/account-executive.png',
                    description: 'Mis Ejecutivo de Cuenta',
                    onPress: () {
                      navigateToAccountExecutive(
                        context,
                        widget.accountExecutiveBloc,
                      );
                    })
              ],
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 50, right: 10, left: 10),
            child: SecondaryButton(
              isEnabled: true,
              labelText: 'CONTACTANOS',
              size: 80,
              onPressed: () {
                navigateToContact(context, widget.contactBloc);
              },
              asset: 'assets/images/mail.png',
            ),
          ),
          //
        ],
      );
}
