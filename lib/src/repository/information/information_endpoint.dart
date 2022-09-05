import 'dart:io';

import '../../utils/preferences/preferences_user.dart';
import '../network/endpoint.dart';

class InformationEndpoint extends Endpoint {
  final DateTime since;
  final DateTime until;
  final int typeInform;
  InformationEndpoint(
      {required this.since, required this.until, required this.typeInform});
  @override
  Method get method => Method.post;

  @override
  Map<String, String> get headers => {
        HttpHeaders.authorizationHeader: 'Bearer ${PreferencesUser().token}',
      };

  @override
  Map<String, dynamic> get parameters => {
        // TODO cambiar por los valores entrantes
        // 'cedulaColaborador': PreferencesUser().document,
        // 'idCliente': '0000095573',
        'idCliente': PreferencesUser().idClient,
        'fechaDesde': '01/02/2022',
        'fechaHasta': '01/05/2022',
        // 'fechaDesde': '${since.day}/${since.day}/${since.year}',
        // 'fechaHasta': '${until.day}/${until.day}/${until.year}',
        'tipo_informe': typeInform.toString()
      };

  @override
  String get path => 'api/sortime/Informes';
}
