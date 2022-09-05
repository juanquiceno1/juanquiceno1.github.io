import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.cedula,
    required this.nombre,
    required this.cliente,
    required this.eps,
    required this.contrato,
    required this.afp,
    required this.fechaIngreso,
    required this.ccf,
    required this.fechaRetiro,
    required this.arl,
    required this.banco,
    required this.nroCuenta,
    required this.cargo,
  });

  String cedula;
  String nombre;
  String cliente;
  String eps;
  String contrato;
  String afp;
  String fechaIngreso;
  String ccf;
  String fechaRetiro;
  String arl;
  String banco;
  String nroCuenta;
  String cargo;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        cedula: json['cedula'] == null ? '' : json['cedula'].toString(),
        nombre: json['nombre'] == null ? '' : json['nombre'].toString(),
        cliente: json['cliente'] == null ? '' : json['cliente'].toString(),
        eps: json['EPS'] == null ? '' : json['EPS'].toString(),
        contrato: json['contrato'] == null ? '' : json['contrato'].toString(),
        afp: json['AFP'] == null ? '' : json['AFP'].toString(),
        fechaIngreso:
            json['fechaIngreso'] == null ? '' : json['fechaIngreso'].toString(),
        ccf: json['CCF'] == null ? '' : json['CCF'].toString(),
        fechaRetiro:
            json['fechaRetiro'] == null ? '' : json['fechaRetiro'].toString(),
        arl: json['ARL'] == null ? '' : json['ARL'].toString(),
        banco: json['banco'] == null ? '' : json['banco'].toString(),
        nroCuenta:
            json['nroCuenta'] == null ? '' : json['nroCuenta'].toString(),
        cargo: json['cargo'] == null ? '' : json['cargo'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'cedula': cedula,
        'nombre': nombre,
        'cliente': cliente,
        'EPS': eps,
        'contrato': contrato,
        'AFP': afp,
        'fechaIngreso': fechaIngreso,
        'CCF': ccf,
        'fechaRetiro': fechaRetiro,
        'ARL': arl,
        'banco': banco,
        'nroCuenta': nroCuenta,
        'cargo': cargo,
      };
}
