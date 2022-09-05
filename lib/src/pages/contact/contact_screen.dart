import 'package:client/src/bloc/contact/contact_bloc.dart';
import 'package:client/src/models/cards/card_description_model.dart';
import 'package:client/src/routes/navigation.dart';
import 'package:client/src/widget/shimmer/shimmer_generic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../models/contact/contact_model.dart';
import '../../utils/external/external_open.dart';
import '../../utils/theme/colors.dart';
import '../../widget/buttons/secondary_button.dart';
import '../../widget/cards/card_description_loading.dart';
import '../../widget/cards/items_card_information.dart';

class ContactScreen extends StatefulWidget {
  static const String routeName = 'contact_screen';
  final ContactBloc contactBloc;
  const ContactScreen({
    Key? key,
    required this.contactBloc,
  }) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String? selectedCity;

  List<ContactDescriptionModel> data = [];
  List<CardDescriptionModel> cardDescriptions = [];

  @override
  void initState() {
    widget.contactBloc.add(ContactGetDataEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) =>
      BlocBuilder<ContactBloc, ContactState>(
        bloc: widget.contactBloc,
        builder: (context, state) {
          if (state is ContactDataState) {
            widget.contactBloc.add(ContactInitialEvent());
            selectedCity = null;
            data = state.data;
            Future.delayed(Duration.zero, () {
              setState(() {});
            });
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                _background(state),
                _information(state),
              ],
            ),
          );
        },
      );

  Widget _background(ContactState state) => SizedBox(
        height: 33.h,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
              'assets/green_background_mid.png',
              fit: BoxFit.cover,
              height: 33.h,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              children: [
                SizedBox(height: 20),
                SafeArea(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (Navigator.canPop(context))
                                IconButton(
                                  onPressed: () => navigatePop(context, true),
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: AppColors.white,
                                  ),
                                ),
                              if (Navigator.canPop(context)) SizedBox(width: 5),
                              Text(
                                'Contactanos',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: AppColors.white,
                                    ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                      PopupMenuButton(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            )),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Text('Política de Datos'),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Text('Ayuda'),
                          ),
                          PopupMenuItem(
                            value: 3,
                            child: Text(
                              'Cerrar Sesion',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          )
                        ],
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.more_vert_rounded,
                            color: AppColors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: state is ContactLoadingState
                    ? Container(
                        height: 55,
                        width: 90.w,
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: ShimmerGeneric(
                          height: 55,
                          width: 90.w,
                          align: Alignment.bottomCenter,
                        ),
                      )
                    : data.isNotEmpty
                        ? _cityModal()
                        : null,
              ),
            ),
          ],
        ),
      );

  Widget _information(ContactState state) => Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        color: AppColors.white,
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                state is ContactLoadingState
                    ? ShimmerGeneric()
                    : data.isNotEmpty
                        ? Text(
                            selectedCity ?? 'Elige tu ciudad',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1!
                                .copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                          )
                        : SizedBox(),
                Divider(),
                if (state is ContactLoadingState)
                  for (int i = 0; i < 5; i++) CardDescriptionLoading()
                else
                  selectedCity != null
                      ? ItemsCardInformation(
                          items: cardDescriptions,
                          onPressed: () {
                            selectedCity = null;
                            widget.contactBloc.add(ContactGetDataEvent());
                          },
                        )
                      : SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 50, right: 10, left: 10),
                  child: state is ContactLoadingState
                      ? ShimmerGeneric(
                          height: 55,
                          width: 90.w,
                          align: Alignment.bottomCenter,
                        )
                      : data.isNotEmpty && selectedCity != null
                          ? SecondaryButton(
                              isEnabled: true,
                              labelText: 'WHATSAPP CHAT',
                              size: 80,
                              onPressed: () {
                                ExternalOpen().url(
                                  url: data
                                      .where((element) =>
                                          element.city == selectedCity)
                                      .first
                                      .linkChat,
                                );
                              },
                              asset: 'assets/icon/chat.png',
                            )
                          : null,
                )
              ],
            ),
          ),
        ),
      );

  Widget _cityModal() => Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.darkGrey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          color: AppColors.white,
        ),
        child: DropdownButton<String>(
          focusColor: Colors.white,
          iconEnabledColor: AppColors.primaryColor,
          value: selectedCity,
          isExpanded: true,
          hint: Text('Selecciona tu ciudad'),
          underline: SizedBox(),
          elevation: 9,
          style: TextStyle(color: Colors.red),
          items: data
              .map<DropdownMenuItem<String>>((ContactDescriptionModel value) {
            return DropdownMenuItem<String>(
              value: value.city,
              child: Text(
                value.city,
                style: TextStyle(color: AppColors.primaryColor),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedCity = value;
              try {
                cardDescriptions = data
                    .where((element) => element.city == value)
                    .first
                    .information;
              } catch (e) {
                cardDescriptions = [];
              }
            });
          },
        ),
      );
}
