import 'dart:convert';

AbsenteeismListModel absenteeismListModelFromJson(String str) =>
    AbsenteeismListModel.fromJson(json.decode(str));

String absenteeismListModelToJson(AbsenteeismListModel data) =>
    json.encode(data.toJson());

class AbsenteeismListModel {
  AbsenteeismListModel({
    required this.link,
    required this.data,
  });

  String link;
  List<AbsenteeismModel> data;

  factory AbsenteeismListModel.fromJson(Map<String, dynamic> json) =>
      AbsenteeismListModel(
        link: json['link'] == null ? '' : json['link'].toString(),
        data: json['data'] == null
            ? []
            : List<AbsenteeismModel>.from(
                json['data'].map((x) => AbsenteeismModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'link': link,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AbsenteeismModel {
  AbsenteeismModel({
    required this.cedula,
    required this.nombreEmpleado,
    required this.contrato,
    required this.sucursal,
    required this.cliente,
    required this.nomina,
    required this.codNomina,
    required this.noAusentismo,
    required this.mes,
    required this.fechaDesde,
    required this.fechaHasta,
    required this.fechaNovedad,
    required this.noDias,
    required this.valorAusentismo,
    required this.tipoDeAusentismo,
    required this.motivo,
  });

  String cedula;
  String nombreEmpleado;
  String contrato;
  String sucursal;
  String cliente;
  String nomina;
  String codNomina;
  String noAusentismo;
  String mes;
  String fechaDesde;
  String fechaHasta;
  String fechaNovedad;
  String noDias;
  String valorAusentismo;
  String tipoDeAusentismo;
  String motivo;

  factory AbsenteeismModel.fromJson(Map<String, dynamic> json) =>
      AbsenteeismModel(
        cedula: json['CEDULA'] == null ? '' : json['CEDULA'].toString(),
        nombreEmpleado: json['NOMBRE EMPLEADO'] == null
            ? ''
            : json['NOMBRE EMPLEADO'].toString(),
        contrato: json['CONTRATO'] == null ? '' : json['CONTRATO'].toString(),
        sucursal: json['SUCURSAL'] == null ? '' : json['SUCURSAL'].toString(),
        cliente: json['CLIENTE'] == null ? '' : json['CLIENTE'].toString(),
        nomina: json['NOMINA'] == null ? '' : json['NOMINA'].toString(),
        codNomina:
            json['COD NOMINA'] == null ? '' : json['COD NOMINA'].toString(),
        noAusentismo: json['NO. AUSENTISMO'] == null
            ? ''
            : json['NO. AUSENTISMO'].toString(),
        mes: json['MES'] == null ? '' : json['MES'].toString(),
        fechaDesde:
            json['FECHA DESDE'] == null ? '' : json['FECHA DESDE'].toString(),
        fechaHasta:
            json['FECHA HASTA'] == null ? '' : json['FECHA HASTA'].toString(),
        fechaNovedad: json['FECHA NOVEDAD'] == null
            ? ''
            : json['FECHA NOVEDAD'].toString(),
        noDias: json['NO. DIAS'] == null ? '' : json['NO. DIAS'].toString(),
        valorAusentismo: json['VALOR AUSENTISMO'] == null
            ? ''
            : json['VALOR AUSENTISMO'].toString(),
        tipoDeAusentismo: json['TIPO DE AUSENTISMO'] == null
            ? ''
            : json['TIPO DE AUSENTISMO'].toString(),
        motivo: json['MOTIVO'] == null ? '' : json['MOTIVO'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'CEDULA': cedula,
        'NOMBRE EMPLEADO': nombreEmpleado,
        'CONTRATO': contrato,
        'SUCURSAL': sucursal,
        'CLIENTE': cliente,
        'NOMINA': nomina,
        'COD NOMINA': codNomina,
        'NO. AUSENTISMO': noAusentismo,
        'MES': mes,
        'FECHA DESDE': fechaDesde,
        'FECHA HASTA': fechaHasta,
        'FECHA NOVEDAD': fechaNovedad,
        'NO. DIAS': noDias,
        'VALOR AUSENTISMO': valorAusentismo,
        'TIPO DE AUSENTISMO': tipoDeAusentismo,
        'MOTIVO': motivo,
      };
}
