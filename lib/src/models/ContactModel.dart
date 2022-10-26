class ContactModel {
  String? name;
  String? phoneNumber;

  ContactModel({this.name, this.phoneNumber});

  ContactModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}