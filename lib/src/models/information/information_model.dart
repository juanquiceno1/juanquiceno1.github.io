import 'dart:convert';

InformationListModel informationListModelFromJson(String str) =>
    InformationListModel.fromJson(json.decode(str));

String informationListModelToJson(InformationListModel data) =>
    json.encode(data.toJson());

class InformationListModel {
  InformationListModel({
    required this.data,
    required this.link,
  });
  String link;
  List<InformationModel> data;

  factory InformationListModel.fromJson(Map<String, dynamic> json) =>
      InformationListModel(
        link: json['link'] == null ? '' : json['link'].toString(),
        data: json['data'] == null
            ? []
            : List<InformationModel>.from(
                json['data'].map((x) => InformationModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'link': link,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class InformationModel {
  InformationModel({
    required this.tipoDocumento,
    required this.numeroDeDocumento,
    required this.nombre1,
    required this.nombre2,
    required this.apellido1,
    required this.apellido2,
    required this.ciudadExpide,
    required this.fNacimiento,
    required this.sexo,
    required this.eps,
    required this.afp,
    required this.fCesantias,
    required this.caja,
    required this.arp,
    required this.nomina,
    required this.fechaIngreso,
    required this.fechaVencimiento,
    required this.salario,
    required this.cargo,
    required this.ciudadVive,
    required this.centroTrabajo,
    required this.estadoCivil,
  });

  String tipoDocumento;
  String numeroDeDocumento;
  String nombre1;
  String nombre2;
  String apellido1;
  String apellido2;
  String ciudadExpide;
  String fNacimiento;
  String sexo;
  String eps;
  String afp;
  String fCesantias;
  String caja;
  String arp;
  String nomina;
  String fechaIngreso;
  String fechaVencimiento;
  String salario;
  String cargo;
  String ciudadVive;
  String centroTrabajo;
  String estadoCivil;

  factory InformationModel.fromJson(Map<String, dynamic> json) =>
      InformationModel(
        tipoDocumento: json['TIPO DOCUMENTO'] == null
            ? ''
            : json['TIPO DOCUMENTO'].toString(),
        numeroDeDocumento: json['NUMERO DE DOCUMENTO'] == null
            ? ''
            : json['NUMERO DE DOCUMENTO'].toString(),
        nombre1: json['NOMBRE 1'] == null ? '' : json['NOMBRE 1'].toString(),
        nombre2: json['NOMBRE 2'] == null ? '' : json['NOMBRE 2'].toString(),
        apellido1:
            json['APELLIDO 1'] == null ? '' : json['APELLIDO 1'].toString(),
        apellido2:
            json['APELLIDO 2'] == null ? '' : json['APELLIDO 2'].toString(),
        ciudadExpide: json['CIUDAD EXPIDE'] == null
            ? ''
            : json['CIUDAD EXPIDE'].toString(),
        fNacimiento: json['F. NACIMIENTO'] == null
            ? ''
            : json['F. NACIMIENTO'].toString(),
        sexo: json['SEXO'] == null ? '' : json['SEXO'].toString(),
        eps: json['EPS'] == null ? '' : json['EPS'].toString(),
        afp: json['AFP'] == null ? '' : json['AFP'].toString(),
        fCesantias:
            json['F. CESANTIAS'] == null ? '' : json['F. CESANTIAS'].toString(),
        caja: json['CAJA'] == null ? '' : json['CAJA'].toString(),
        arp: json['ARP'] == null ? '' : json['ARP'].toString(),
        nomina: json['NOMINA'] == null ? '' : json['NOMINA'].toString(),
        fechaIngreso: json['FECHA INGRESO'] == null
            ? ''
            : json['FECHA INGRESO'].toString(),
        fechaVencimiento: json['FECHA VENCIMIENTO'] == null
            ? ''
            : json['FECHA VENCIMIENTO'].toString(),
        salario: json['SALARIO'] == null ? '' : json['SALARIO'].toString(),
        cargo: json['CARGO'] == null ? '' : json['CARGO'].toString(),
        ciudadVive:
            json['CIUDAD VIVE'] == null ? '' : json['CIUDAD VIVE'].toString(),
        centroTrabajo: json['CENTRO TRABAJO'] == null
            ? ''
            : json['CENTRO TRABAJO'].toString(),
        estadoCivil:
            json['ESTADO CIVIL'] == null ? '' : json['ESTADO CIVIL'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'TIPO DOCUMENTO': tipoDocumento,
        'NUMERO DE DOCUMENTO': numeroDeDocumento,
        'NOMBRE 1': nombre1,
        'NOMBRE 2': nombre2,
        'APELLIDO 1': apellido1,
        'APELLIDO 2': apellido2,
        'CIUDAD EXPIDE': ciudadExpide,
        'F. NACIMIENTO': fNacimiento,
        'SEXO': sexo,
        'EPS': eps,
        'AFP': afp,
        'F. CESANTIAS': fCesantias,
        'CAJA': caja,
        'ARP': arp,
        'NOMINA': nomina,
        'FECHA INGRESO': fechaIngreso,
        'FECHA VENCIMIENTO': fechaVencimiento,
        'SALARIO': salario,
        'CARGO': cargo,
        'CIUDAD VIVE': ciudadVive,
        'CENTRO TRABAJO': centroTrabajo,
        'ESTADO CIVIL': estadoCivil,
      };
}
