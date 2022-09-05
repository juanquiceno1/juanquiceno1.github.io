class CardDescriptionModel {
  CardDescriptionModel({
    required this.icon,
    required this.title,
    required this.description,
  });

  String icon;
  String title;
  String description;

  factory CardDescriptionModel.fromJson(Map<String, dynamic> json) =>
      CardDescriptionModel(
        icon: json['icon'] == null ? '' : json['icon'].toString(),
        title: json['title'] == null ? '' : json['title'].toString(),
        description:
            json['description'] == null ? '' : json['description'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'icon': icon,
        'title': title,
        'description': description,
      };
}
