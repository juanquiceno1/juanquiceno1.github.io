import 'package:client/src/bloc/account_executive/account_executive_bloc.dart';
import 'package:client/src/models/account_executive/account_execute_model.dart';
import 'package:client/src/pages/error/view_error.dart';
import 'package:client/src/utils/external/external_open.dart';
import 'package:client/src/widget/shimmer/shimmer_generic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widget/appbar/app_bar_back.dart';
import '../../../widget/buttons/secondary_button.dart';
import '../../../widget/cards/card_account_executive.dart';
import '../../../widget/cards/card_description_loading.dart';
import '../../../widget/cards/items_card_information.dart';

class AccountExecutiveScreen extends StatefulWidget {
  static const String routeName = 'account_executive';
  final AccountExecutiveBloc accountExecutiveBloc;
  const AccountExecutiveScreen({
    Key? key,
    required this.accountExecutiveBloc,
  }) : super(key: key);

  @override
  _AccountExecutiveScreenState createState() => _AccountExecutiveScreenState();
}

class _AccountExecutiveScreenState extends State<AccountExecutiveScreen> {
  AccountExcecutiveModel accountExecutive = AccountExcecutiveModel.fromJson({});
  FToast fToast = FToast();
  @override
  void initState() {
    fToast.init(context);
    widget.accountExecutiveBloc.add(AccountExecutiveGetDataEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) =>
      BlocBuilder<AccountExecutiveBloc, AccountExecutiveState>(
        bloc: widget.accountExecutiveBloc,
        builder: (context, state) {
          if (state is AccountExecutiveDataState) {
            widget.accountExecutiveBloc.add(AccountExecutiveInitialEvent());
            accountExecutive = state.account;
            Future.delayed(Duration.zero, () {
              setState(() {});
            });
          } else if (state is AccountExecutiveErrorState) {
            return ViewError(onPressed: () {});
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                AppBarBack(
                  title: 'Mi Ejecutivo de Cuenta',
                ),
                SizedBox(height: 20),
                CardAccountExecutive(
                  image: accountExecutive.image,
                  loading: state is AccountExecutiveLoadingState ? true : false,
                  child: state is AccountExecutiveLoadingState
                      ? _loading()
                      : _data(context),
                ),
                SizedBox(height: 50)
              ],
            ),
          );
        },
      );

  Widget _data(
    BuildContext context,
  ) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            Text(
              accountExecutive.nombre,
              style: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                    fontSize: 19.sp,
                  ),
            ),
            Text(
              accountExecutive.cargo,
              style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                    fontSize: 14.sp,
                  ),
            ),
            ItemsCardInformation(
              items: accountExecutive.information,
              onPressed: () {
                widget.accountExecutiveBloc.add(AccountExecutiveGetDataEvent());
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 10, right: 10, left: 10),
              child: SecondaryButton(
                isEnabled: true,
                labelText: 'WHATSAPP CHAT',
                size: 80,
                onPressed: () {
                  ExternalOpen().url(url: accountExecutive.linkChat);
                },
                asset: 'assets/icon/chat.png',
              ),
            )
          ],
        ),
      );

  Widget _loading() {
    return Column(
      children: [
        SizedBox(height: 5),
        ShimmerGeneric(
          width: 70.w,
        ),
        SizedBox(height: 5),
        ShimmerGeneric(
          width: 50.w,
        ),
        for (int i = 0; i < 5; i++) CardDescriptionLoading(),
        SizedBox(height: 30),
        ShimmerGeneric(
          width: 70.w,
        ),
      ],
    );
  }
}
