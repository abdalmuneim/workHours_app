class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;

  UserModel({this.uid, this.firstName, this.lastName, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}
