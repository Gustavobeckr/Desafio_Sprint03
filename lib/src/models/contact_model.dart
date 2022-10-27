class ContactModel {
  int? id;
  String? name;
  String? phoneNumber;

  ContactModel({this.name, this.phoneNumber, this.id});

  ContactModel.fromJson(Map<String, dynamic> json, this.id) {
    name = json['name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    return data;
  }

  @override
  String toString(){
    return 'Contact{name: $name, phone_number: $phoneNumber, id: $id}';
  }
}