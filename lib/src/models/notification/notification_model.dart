import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) =>
    NotificationsModel.fromJson(json.decode(str));

String notificationsModelToJson(NotificationsModel data) =>
    json.encode(data.toJson());

class NotificationsModel {
  NotificationsModel({
    required this.notifications,
  });

  List<NotificationModel> notifications;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        notifications: json['notifications'] == null
            ? []
            : List<NotificationModel>.from(json['notifications']
                .map((x) => NotificationModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'notifications':
            List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class NotificationModel {
  NotificationModel({
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
  });

  String title;
  String description;
  bool status;
  DateTime createdAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        title: json['title'] == null ? 'Sin titulo' : json['title'].toString(),
        description: json['description'] == null
            ? 'Sin Descripción'
            : json['description'].toString(),
        status: json['status'] ?? false,
        createdAt: json['createdAt'] == null
            ? DateTime.now()
            : DateTime.tryParse(json['createdAt']) ?? DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'status': status,
        'createdAt': createdAt.toIso8601String(),
      };
}
