import 'dart:convert';

import '../cards/card_description_model.dart';

AccountExcecutiveModel accountExecutiveFromJson(String str) =>
    AccountExcecutiveModel.fromJson(json.decode(str));

String welcomeToJson(AccountExcecutiveModel data) => json.encode(data.toJson());

class AccountExcecutiveModel {
  AccountExcecutiveModel({
    required this.image,
    required this.nombre,
    required this.cargo,
    required this.linkChat,
    required this.information,
  });

  String image;
  String nombre;
  String cargo;
  String linkChat;
  List<CardDescriptionModel> information;

  factory AccountExcecutiveModel.fromJson(Map<String, dynamic> json) =>
      AccountExcecutiveModel(
        image: json['image'] == null ? '' : json['image'].toString(),
        nombre: json['nombre'] == null ? '' : json['nombre'].toString(),
        cargo: json['cargo'] == null ? '' : json['cargo'].toString(),
        linkChat: json['link_chat'] == null ? '' : json['link_chat'].toString(),
        information: json['information'] == null
            ? []
            : List<CardDescriptionModel>.from(json['information']
                .map((x) => CardDescriptionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'nombre': nombre,
        'cargo': cargo,
        'link_chat': linkChat,
        'information': List<dynamic>.from(information.map((x) => x.toJson())),
      };
}
