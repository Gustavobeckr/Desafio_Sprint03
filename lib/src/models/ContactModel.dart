class ContactModel {
  int? _number;
  String? _name;

  ContactModel({int? id, String? title}) {
    if (id != null) {
      this._number = id;
    }
    if (title != null) {
      this._name = title;
    }
  }

  int? get id => _number;

  set id(int? id) => _number = id;

  String? get title => _name;

  set title(String? title) => _name = title;

  ContactModel.fromJson(Map<String, dynamic> json) {
    _number = json['id'];
    _name = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._number;
    data['title'] = this._name;
    return data;
  }
}
