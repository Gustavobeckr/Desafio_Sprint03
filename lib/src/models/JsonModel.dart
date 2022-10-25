
class JsonModel {
  late final String name;
  late final int number;

  JsonModel({required this.name, required this.number});

  factory JsonModel.fromJson(Map json) {
    return JsonModel(
      name: json['title'],
      number: json['id'],
    );
  }

  Map toJson() {
    return {
      'title': name,
      'id': number,
    };
  }
}