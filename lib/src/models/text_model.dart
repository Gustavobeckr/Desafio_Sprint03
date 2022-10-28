class TextModel {
  String? text;
  String? author;

  TextModel({this.text, this.author});

  TextModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['author'] = this.author;
    return data;
  }
}
// class TextModel {
//   String? author;
//   String? text;
//
//   TextModel({this.author, this.text});
//
//   TextModel.fromJson(Map<String, dynamic> json) {
//     author = json['name'];
//     text = json['phone_number'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.author;
//     data['phone_number'] = this.text;
//     return data;
//   }
// }


