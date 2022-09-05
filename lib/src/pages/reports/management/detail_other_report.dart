import 'package:client/src/widget/loading/loading_logo.dart';
import 'package:client/src/widget/toast/toast_generic.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';

import '../../../bloc/information/information_bloc.dart';
import '../../../models/information/absenteeism_model.dart';
import '../../../models/information/information_model.dart';
import '../../../models/information/retired_contracts_model.dart';
import '../../../utils/constants.dart';
import '../../../utils/permission/permission.dart';
import '../../../utils/theme/colors.dart';
import '../../../widget/appbar/app_bar_back.dart';
import '../../../widget/modals/modal_generic.dart';
import '../../error/view_error.dart';
import '../widget/card_loading.dart';
import '../widget/filter_date.dart';
import 'card_other_report.dart';

class DetailOtherReportScreen extends StatefulWidget {
  static const String routeName = 'detail_other_report_screen';
  final int report;
  final String title;
  final InformationBloc informationBloc;
  const DetailOtherReportScreen({
    Key? key,
    required this.report,
    required this.informationBloc,
    required this.title,
  }) : super(key: key);

  @override
  State<DetailOtherReportScreen> createState() =>
      _DetailOtherReportScreenState();
}

class _DetailOtherReportScreenState extends State<DetailOtherReportScreen> {
  String? downloadFile;
  bool isLoading = false;
  FToast fToast = FToast();
  @override
  void initState() {
    fToast.init(context);
    widget.informationBloc
        .add(InformationOtherReportEvent(typeInform: widget.report));
    super.initState();
  }

  @override
  void dispose() {
    widget.informationBloc.add(InformationInitialEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformationBloc, InformationState>(
      bloc: widget.informationBloc,
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              _content(context, state),
              if (isLoading) LoadingLogo(),
            ],
          ),
          floatingActionButton:
              downloadFile != null && downloadFile != '' && !isLoading
                  ? FloatingActionButton(
                      child: Icon(Icons.file_download_rounded),
                      onPressed: () {
                        _downLoad();
                      },
                    )
                  : null,
        );
      },
    );
  }

  Widget _content(BuildContext context, InformationState state) =>
      SingleChildScrollView(
        child: Column(
          children: [
            AppBarBack(
              title: widget.title,
              onOption: IconButton(
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
                      widget:
                          FilterDate(informationBloc: widget.informationBloc),
                    ),
                  );
                },
                icon: ImageIcon(
                  AssetImage('assets/icon/filter.png'),
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  if (state is LoadingReportState)
                    Column(
                      children: [
                        SizedBox(height: 20),
                        for (int i = 0; i < 5; i++) CardLoading()
                      ],
                    )
                  else if (state is InformationReportErrorState)
                    ViewError(
                      heightImage: 20.h,
                      onPressed: () {
                        widget.informationBloc.add(InformationOtherReportEvent(
                            typeInform: widget.report));
                      },
                    )
                  else if (state is InformationReport2State)
                    _report2(state.data)
                  else if (state is InformationReport3State)
                    _report3(state.data)
                  else if (state is InformationReport4State)
                    _report4(state.data)
                  else
                    Text('data'),
                  SizedBox(height: 50)
                ],
              ),
            )
          ],
        ),
      );

  _report2(RetiredContractsListModel retireContracts) {
    downloadFile = retireContracts.link;
    return Column(
      children: [
        SizedBox(height: 20),
        for (RetiredContractModel item in retireContracts.data)
          CardOtherReport(
            image: '',
            item1: '${item.tipoDocumento}: ${item.numeroDeDocumento}',
            item2:
                '${item.nombre1} ${item.nombre2} ${item.apellido1} ${item.apellido2}',
            item3: item.cargo,
            item4: 'Ingreso: ${item.fechaIngreso} \nRetiro ${item.fechaRetiro}',
          )
      ],
    );
  }

  _report3(InformationListModel information) {
    downloadFile = information.link;
    return Column(
      children: [
        SizedBox(height: 20),
        for (InformationModel item in information.data)
          CardOtherReport(
            image: '',
            item1: '${item.tipoDocumento}: ${item.numeroDeDocumento}',
            item2:
                '${item.nombre1} ${item.nombre2} ${item.apellido1} ${item.apellido2}',
            item3: item.cargo,
          )
      ],
    );
  }

  _report4(AbsenteeismListModel absenteeism) {
    downloadFile = absenteeism.link;
    return Column(
      children: [
        SizedBox(height: 20),
        for (AbsenteeismModel item in absenteeism.data)
          CardOtherReport(
            image: '',
            item1: 'Incapacidad: ${item.noAusentismo}',
            item2: item.nombreEmpleado,
            item3: 'Motivo incapacidad: ${item.tipoDeAusentismo}',
            item4:
                'Inicio incapacidad: ${item.fechaDesde} \nTermina incapacidad ${item.fechaHasta}',
          )
      ],
    );
  }

  Future<void> _downLoad() async {
    List<String> temp = downloadFile!.split('.');
    try {
      setState(() => isLoading = true);
      if (await PermissionCustom().getStoragePermission()) {
        var dio = Dio();
        var uuid = Uuid().v1();
        await dio.download(
          downloadFile!,
          '$pathDonwload/$uuid.${temp.elementAt(temp.length - 1)}',
        );
        setState(() => isLoading = false);
        ToastGeneric.toast(
          context: context,
          fToast: fToast,
          description: 'Archivo descargado',
        );
        await OpenFile.open(
          '$pathDonwload/$uuid.${temp.elementAt(temp.length - 1)}',
        );
      } else {
        setState(() => isLoading = false);
        ToastGeneric.toast(
          context: context,
          fToast: fToast,
          description: 'Acceso denegado a los archivos',
        );
      }
    } catch (e) {
      setState(() => isLoading = false);
      ToastGeneric.toast(
        context: context,
        fToast: fToast,
        description: 'Error al abrir el archivo',
      );
    }
  }
}
