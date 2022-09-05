import 'dart:convert';

import '../cards/card_description_model.dart';

ContactListModel contactListModelFromJson(String str) =>
    ContactListModel.fromJson(json.decode(str));

String contactListModelToJson(ContactListModel data) =>
    json.encode(data.toJson());

class ContactListModel {
  ContactListModel({
    required this.data,
  });

  List<ContactDescriptionModel> data;

  factory ContactListModel.fromJson(Map<String, dynamic> json) =>
      ContactListModel(
        data: json['data'] == null
            ? []
            : List<ContactDescriptionModel>.from(
                json['data'].map((x) => ContactDescriptionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ContactDescriptionModel {
  ContactDescriptionModel({
    required this.city,
    required this.linkChat,
    required this.information,
  });

  String city;
  String linkChat;
  List<CardDescriptionModel> information;

  factory ContactDescriptionModel.fromJson(Map<String, dynamic> json) =>
      ContactDescriptionModel(
        city: json['city'] == null ? '' : json['city'].toString(),
        linkChat: json['link_chat'] == null ? '' : json['link_chat'].toString(),
        information: json['information'] == null
            ? []
            : List<CardDescriptionModel>.from(json['information']
                .map((x) => CardDescriptionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'city': city,
        'link_chat': linkChat,
        'information': List<dynamic>.from(information.map((x) => x.toJson())),
      };
}
