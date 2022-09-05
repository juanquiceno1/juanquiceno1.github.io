import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/src/bloc/information/information_bloc.dart';
import 'package:client/src/models/information/information_model.dart';
import 'package:client/src/pages/reports/widget/filter_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/theme/colors.dart';
import '../../widget/appbar/app_bar_description.dart';
import '../../widget/modals/modal_generic.dart';
import '../../widget/text_field/style_underline/search_style.dart';
import '../error/view_error.dart';
import 'headcount/headcount.dart';
import 'management/management.dart';
import 'payroll/payroll.dart';

class ReportsScreen extends StatefulWidget {
  static const String routeName = 'reports';
  final InformationBloc informationBloc;
  const ReportsScreen({
    Key? key,
    required this.informationBloc,
  }) : super(key: key);

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final ThemeData theme = ThemeData();
  int _options = 0;
  List<InformationModel> informationData = [];

  String totalMen = '0';
  String totalWomen = '0';

  bool isLoading = false;

  @override
  void initState() {
    _options = 0;
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
      BlocBuilder<InformationBloc, InformationState>(
        bloc: widget.informationBloc,
        builder: (context, state) {
          if (state is Loading) {
            Future.delayed(Duration.zero, () {
              setState(() {
                isLoading = true;
              });
            });
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                AppBarDescription(
                  title: 'Informes',
                ),
                _body(context, state),
              ],
            ),
          );
        },
      );

  Widget _body(BuildContext context, InformationState state) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            SizedBox(height: 20),
            _search(context),
            SizedBox(height: 10),
            _option(),
            SizedBox(height: 10),
            if (state is InformationErrorState)
              ViewError(
                onPressed: () {
                  widget.informationBloc.add(InformationDataEvent());
                },
              )
            else
              Column(
                children: [
                  if (_options == 0)
                    HeadCount(
                      bloc: widget.informationBloc,
                    )
                  else if (_options == 1)
                    Payroll(bloc: widget.informationBloc, data: informationData)
                  else if (_options == 2)
                    Management(
                      informationBloc: widget.informationBloc,
                    )
                ],
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
            onPressed: () {
              FocusScope.of(context).unfocus();
              showModalBottomSheet(
                elevation: ModalGeneric().elevation(),
                context: this.context,
                isScrollControlled: true,
                isDismissible: false,
                shape: ModalGeneric().style(),
                builder: (_) => ModalGeneric(
                  title: 'Filtro',
                  widget: FilterDate(informationBloc: widget.informationBloc),
                ),
              );
            },
            icon: ImageIcon(
              AssetImage('assets/icon/filter.png'),
              color: AppColors.primaryColor,
            ),
          )
        ],
      );

  Widget _option() => Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _options = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: _options == 0 ? Colors.green : Colors.grey[100],
                      borderRadius: BorderRadius.circular(50)),
                  child: AutoSizeText(
                    'Headcount',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subtitle1!
                        .copyWith(
                          color: _options == 0 ? Colors.white : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            if (_options != 0 && _options != 1)
              Container(
                height: 15,
                width: 1,
                color: AppColors.darkGrey,
              ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _options = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: _options == 1 ? Colors.green : Colors.grey[100],
                      borderRadius: BorderRadius.circular(50)),
                  child: AutoSizeText(
                    'Nómina',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subtitle1!
                        .copyWith(
                          color: _options == 1 ? Colors.white : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            if (_options != 1 && _options != 2)
              Container(
                height: 15,
                width: 1,
                color: AppColors.darkGrey,
              ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _options = 2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: _options == 2 ? Colors.green : Colors.grey[100],
                      borderRadius: BorderRadius.circular(50)),
                  child: AutoSizeText(
                    'Gestión',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subtitle1!
                        .copyWith(
                          color: _options == 2 ? Colors.white : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
