class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  bool? isVerified;

  UserModel(
      {this.uid, this.firstName, this.lastName, this.email, this.isVerified});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.isVerified = json['isVerified'];
    this.email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['isVerified'] = this.isVerified;
    return data;
  }
}
