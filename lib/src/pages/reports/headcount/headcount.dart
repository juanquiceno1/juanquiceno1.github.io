import 'package:client/src/bloc/information/information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/information/information_model.dart';
import '../../../utils/theme/colors.dart';
import '../widget/report_request_text.dart';
import 'widgets/age_range.dart';
import 'widgets/charges.dart';
import 'widgets/gender.dart';
import 'widgets/item_select.dart';

class HeadCount extends StatefulWidget {
  final InformationBloc bloc;
  const HeadCount({Key? key, required this.bloc}) : super(key: key);

  @override
  State<HeadCount> createState() => _HeadCountState();
}

class _HeadCountState extends State<HeadCount> {
  List<InformationModel> informationData = [];
  String totalMen = '0';
  String totalWomen = '0';
  List rangeAge = [];
  List loads = [];
  List loadsWomen = [];
  List loadsMen = [];
  String selectGenderFilter = 'T';

  @override
  void initState() {
    informationData = widget.bloc.informationList;
    totalMen = widget.bloc.totalMen;
    totalWomen = widget.bloc.totalWomen;
    rangeAge = widget.bloc.rangeAge;
    loads = widget.bloc.loads;
    loadsMen = widget.bloc.loadsMen;
    loadsWomen = widget.bloc.loadsWomen;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformationBloc, InformationState>(
      bloc: widget.bloc,
      builder: (context, state) {
        if (state is InformationSuccess) {
          widget.bloc.add(InformationInitialEvent());
          Future.delayed(Duration.zero, () {
            setState(() {
              informationData = state.information;
              totalMen = state.totalMen;
              totalWomen = state.totalWomen;
              rangeAge = state.rangeAge;
              loads = state.loads;
              loadsMen = state.loadsMen;
              loadsWomen = state.loadsWomen;
            });
          });
        }
        return Column(
          children: [
            Card(
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              elevation: 5,
              child: Container(
                // width: 100.w,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    _gender(),
                    Gender(
                      men: totalMen,
                      women: totalWomen,
                      type: selectGenderFilter,
                    ),
                    SizedBox(height: 40),
                    AgeRange(
                      length: informationData.length,
                      ageRange: rangeAge,
                    ),
                    SizedBox(height: 40),
                    Charges(
                      length: informationData.length,
                      loads: selectGenderFilter == 'M'
                          ? loadsMen
                          : selectGenderFilter == 'F'
                              ? loadsWomen
                              : loads,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            ReportRequestText(),
            SizedBox(height: 60),
          ],
        );
      },
    );
  }

  Widget _gender() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Género',
            style: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        PopupMenuButton(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          onSelected: (value) {
            if (value == 1) {
              setState(() {
                selectGenderFilter = 'T';
              });
            } else if (value == 2) {
              setState(() {
                selectGenderFilter = 'F';
              });
            } else if (value == 3) {
              setState(() {
                selectGenderFilter = 'M';
              });
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: ItemSelect(
                icon: 'assets/icon/hombre-y-mujer.png',
                description: 'Todos',
                select: selectGenderFilter,
                selectDefine: 'T',
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: ItemSelect(
                icon: 'assets/icon/mujer.png',
                description: 'Solo Mujeres',
                select: selectGenderFilter,
                selectDefine: 'F',
              ),
            ),
            PopupMenuItem(
              value: 3,
              child: ItemSelect(
                icon: 'assets/icon/hombre.png',
                description: 'Solo Hombres',
                select: selectGenderFilter,
                selectDefine: 'M',
              ),
            )
          ],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(
              Icons.more_vert_rounded,
              color: AppColors.darkGrey,
              size: 28,
            ),
          ),
        )
      ],
    );
  }
}
