import 'dart:convert';

List<Meals> mealsFromJson(String str) =>
    List<Meals>.from(json.decode(str).map((x) => Meals.fromJson(x)));

String mealsToJson(List<Meals> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Meals {
  String type;
  int comboId;
  String description;

  Meals({
    required this.type,
    required this.comboId,
    required this.description,
  });

  @override
  String toString() {
    return 'Combo: $comboId, Meal: $description';
  }

  factory Meals.fromJson(Map<String, dynamic> json) => Meals(
        type: json["type"],
        comboId: json["comboId"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "comboId": comboId,
        "description": description,
      };
}
