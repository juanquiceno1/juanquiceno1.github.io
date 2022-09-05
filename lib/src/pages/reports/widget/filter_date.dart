import 'package:client/src/bloc/information/information_bloc.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../routes/navigation.dart';
import '../../../utils/theme/colors.dart';
import '../../../widget/buttons/secondary_button.dart';
import '../../../widget/text_field/style_underline/text_field_calendar2.dart';
import '../../../widget/text_field/style_underline/text_filter.dart';

class FilterDate extends StatefulWidget {
  final InformationBloc informationBloc;
  const FilterDate({Key? key, required this.informationBloc}) : super(key: key);

  @override
  State<FilterDate> createState() => _FilterDateState();
}

class _FilterDateState extends State<FilterDate> {
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextFilter(
              description:
                  'Si desea un reporte más detallado comunicate con tu colaborador',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextFilter(
                      description: 'Desde',
                    ),
                    TextFieldCalendar2(
                      description: 'DD / MM /AAAA',
                      initialDate: widget.informationBloc.dateSince,
                      firstDate: widget.informationBloc.dateSince,
                      lastDate: widget.informationBloc.dateNow,
                      onChanged: (value) {
                        widget.informationBloc.dateSince =
                            DateTime.parse(value);
                      },
                    )
                  ],
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  children: [
                    TextFilter(
                      description: 'Hasta',
                    ),
                    TextFieldCalendar2(
                      description: 'DD / MM /AAAA',
                      initialDate: widget.informationBloc.dateUntil,
                      firstDate: DateTime(
                        widget.informationBloc.dateNow.year,
                        widget.informationBloc.dateNow.month - 2,
                        widget.informationBloc.dateNow.day,
                      ),
                      lastDate: widget.informationBloc.dateNow,
                      onChanged: (value) {
                        widget.informationBloc.dateUntil =
                            DateTime.parse(value);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 50),
          SecondaryButton(
            labelText: 'Solicitar',
            isEnabled: true,
            size: 100,
            onPressed: () {
              navigatePop(context, true);
            },
          ),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              top: 20,
            ),
            child: InkWell(
              onTap: () {
                widget.informationBloc.add(InformationResetDateEvent());
                navigatePop(context, true);
              },
              child: Text(
                'Limpiar filtro',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
