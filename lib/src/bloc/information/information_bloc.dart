import 'package:bloc/bloc.dart';
import 'package:client/src/models/information/retired_contracts_model.dart';
import 'package:equatable/equatable.dart';

import '../../../global_locator.dart';
import '../../models/information/absenteeism_model.dart';
import '../../models/information/information_model.dart';
import '../../repository/information/information_repository.dart';

part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  // filter date =================================
  DateTime dateNow = DateTime.now();
  DateTime dateSince = DateTime(
    DateTime.now().year,
    DateTime.now().month - 2,
    DateTime.now().day,
  );
  DateTime dateUntil = DateTime.now();

  // headcount =================================
  List<InformationModel> informationList = [];
  String totalMen = '0';
  String totalWomen = '0';
  List rangeAge = [];
  List loads = [];
  List loadsMen = [];
  List loadsWomen = [];

  InformationBloc() : super(InformationInitial()) {
    on<InformationInitialEvent>(
        (event, emit) => emit(InformationInitialState()));

    on<InformationResetDateEvent>(_informationResetDateState);
    on<InformationDataEvent>(_informationDataState);
    on<InformationOtherReportEvent>(_informationOtherReportState);
  }

  void _informationResetDateState(
      InformationResetDateEvent event, Emitter<InformationState> emit) async {
    dateNow = DateTime.now();
    dateSince = DateTime(
      DateTime.now().year,
      DateTime.now().month - 3,
      DateTime.now().day,
    );
    dateUntil = dateNow;
    emit(InformationInitialState());
  }

  void _informationDataState(
      InformationDataEvent event, Emitter<InformationState> emit) async {
    final api = global<InformationRepository>();
    try {
      emit(Loading());
      Map<String, dynamic> resultApi =
          await api.informes(typeInform: 3, since: dateSince, until: dateUntil);
      if (resultApi['statusCode'] == 200 || resultApi['statusCode'] == 201) {
        informationList = InformationListModel.fromJson(resultApi).data;
        // Calculo porcentaje total hombres y mujeres
        totalMen = ((informationList
                        .where((element) => element.sexo.toUpperCase() == 'M')
                        .length *
                    100) /
                informationList.length)
            .toStringAsPrecision(3);
        totalWomen = ((informationList
                        .where((element) => element.sexo.toUpperCase() == 'F')
                        .length *
                    100) /
                informationList.length)
            .toStringAsPrecision(3);
        // listado de tango de edades
        DateTime dateNow = DateTime.now();
        rangeAge = [
          {
            'title': '(12-29)',
            'value': informationList
                .where((element) =>
                    (DateTime.tryParse(element.fNacimiento) ?? DateTime.now())
                        .isAfter(DateTime(dateNow.year - 12)) &&
                    (DateTime.tryParse(element.fNacimiento) ?? DateTime.now())
                        .isBefore(DateTime(dateNow.year - 29)))
                .toList()
                .length,
          },
          {
            'title': '(30-39)',
            'value': informationList
                .where((element) =>
                    (DateTime.tryParse(element.fNacimiento) ?? DateTime.now())
                        .isAfter(DateTime(dateNow.year - 30)) &&
                    (DateTime.tryParse(element.fNacimiento) ?? DateTime.now())
                        .isBefore(DateTime(dateNow.year - 39)))
                .toList()
                .length,
          },
          {
            'title': '(40-49)',
            'value': informationList
                .where((element) =>
                    (DateTime.tryParse(element.fNacimiento) ?? DateTime.now())
                        .isAfter(DateTime(dateNow.year - 40)) &&
                    (DateTime.tryParse(element.fNacimiento) ?? DateTime.now())
                        .isBefore(DateTime(dateNow.year - 49)))
                .toList()
                .length,
          },
          {
            'title': '(50-60)',
            'value': informationList
                .where((element) =>
                    (DateTime.tryParse(element.fNacimiento) ?? DateTime.now())
                        .isAfter(DateTime(dateNow.year - 50)) &&
                    (DateTime.tryParse(element.fNacimiento) ?? DateTime.now())
                        .isBefore(DateTime(dateNow.year - 60)))
                .toList()
                .length,
          },
          {
            'title': '(+61)',
            'value': informationList
                .where((element) =>
                    (DateTime.tryParse(element.fNacimiento) ?? DateTime.now())
                        .isBefore(DateTime(dateNow.year - 61)))
                .toList()
                .length,
          },
        ];

        // loadsWomen = listaRange('F');
        // loadsMen = listaRange('M');
        List<InformationModel> tempsLoads =
            InformationListModel.fromJson(resultApi).data;
        while (tempsLoads.isNotEmpty) {
          loads.add({
            'title': tempsLoads.first.cargo,
            'value': tempsLoads
                .where((element) => element.cargo == tempsLoads.first.cargo)
                .toList()
                .length
          });
          loadsMen.add({
            'title': tempsLoads.first.cargo,
            'value': tempsLoads
                .where((element) => element.cargo == tempsLoads.first.cargo)
                .where((element) => element.sexo == 'M')
                .toList()
                .length
          });
          loadsWomen.add({
            'title': tempsLoads.first.cargo,
            'value': tempsLoads
                .where((element) => element.cargo == tempsLoads.first.cargo)
                .where((element) => element.sexo == 'F')
                .toList()
                .length
          });
          tempsLoads.removeWhere(
              (element) => element.cargo == tempsLoads.first.cargo);
        }

        emit(InformationSuccess(
          information: informationList,
          totalMen: totalMen,
          totalWomen: totalWomen,
          rangeAge: rangeAge,
          rangeAgeMen: [],
          rangeAgeWomen: [],
          loads: loads,
          loadsMen: loadsMen,
          loadsWomen: loadsWomen,
        ));
      } else {
        emit(InformationErrorState(
          title: 'Upsss',
          message:
              'Tenemos problemas para cargar los datos, intenta nuevamente',
        ));
      }
    } catch (e) {
      emit(InformationErrorState(
        title: 'Upsss',
        message: 'Tenemos problemas para cargar los datos, intenta nuevamente',
      ));
    }
  }

  void _informationOtherReportState(
      InformationOtherReportEvent event, Emitter<InformationState> emit) async {
    final api = global<InformationRepository>();
    try {
      emit(LoadingReportState());
      Map<String, dynamic> resultApi = await api.informes(
        typeInform: event.typeInform,
        since: dateSince,
        until: dateUntil,
      );
      if (resultApi['statusCode'] == 200 || resultApi['statusCode'] == 201) {
        if (event.typeInform == 2) {
          emit(InformationReport2State(
              data: RetiredContractsListModel.fromJson(resultApi)));
        } else if (event.typeInform == 3) {
          emit(
            InformationReport3State(
              data: InformationListModel.fromJson(resultApi),
            ),
          );
        } else if (event.typeInform == 4) {
          emit(
            InformationReport4State(
              data: AbsenteeismListModel.fromJson(resultApi),
            ),
          );
        } else {
          emit(InformationReportErrorState());
        }
      } else {
        emit(InformationReportErrorState());
      }
    } catch (e) {
      emit(InformationReportErrorState());
    }
  }
}
