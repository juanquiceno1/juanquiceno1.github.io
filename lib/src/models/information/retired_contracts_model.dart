import 'dart:convert';

RetiredContractsListModel retiredContractsListModelFromJson(String str) =>
    RetiredContractsListModel.fromJson(json.decode(str));

String retiredContractsListModelToJson(RetiredContractsListModel data) =>
    json.encode(data.toJson());

class RetiredContractsListModel {
  RetiredContractsListModel({
    required this.link,
    required this.data,
  });
  String link;
  List<RetiredContractModel> data;

  factory RetiredContractsListModel.fromJson(Map<String, dynamic> json) =>
      RetiredContractsListModel(
        link: json['link'] == null ? '' : json['link'].toString(),
        data: json['data'] == null
            ? []
            : List<RetiredContractModel>.from(
                json['data'].map((x) => RetiredContractModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'link': link,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RetiredContractModel {
  RetiredContractModel({
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
    required this.fechaRetiro,
    required this.salario,
    required this.cargo,
    required this.ciudadVive,
    required this.centroTrabajo,
    required this.centroCosto,
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
  String fechaRetiro;
  String salario;
  String cargo;
  String ciudadVive;
  String centroTrabajo;
  String centroCosto;

  factory RetiredContractModel.fromJson(Map<String, dynamic> json) =>
      RetiredContractModel(
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
        fechaRetiro:
            json['FECHA RETIRO'] == null ? '' : json['FECHA RETIRO'].toString(),
        salario: json['SALARIO'] == null ? '' : json['SALARIO'].toString(),
        cargo: json['CARGO'] == null ? '' : json['CARGO'].toString(),
        ciudadVive:
            json['CIUDAD VIVE'] == null ? '' : json['CIUDAD VIVE'].toString(),
        centroTrabajo: json['CENTRO TRABAJO'] == null
            ? ''
            : json['CENTRO TRABAJO'].toString(),
        centroCosto:
            json['CENTRO COSTO'] == null ? '' : json['CENTRO COSTO'].toString(),
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
        'FECHA RETIRO': fechaRetiro,
        'SALARIO': salario,
        'CARGO': cargo,
        'CIUDAD VIVE': ciudadVive,
        'CENTRO TRABAJO': centroTrabajo,
        'CENTRO COSTO': centroCosto,
      };
}
