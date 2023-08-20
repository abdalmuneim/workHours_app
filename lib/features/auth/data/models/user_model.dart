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
    if (firstName != null) data['firstName'] = this.firstName;
    if (lastName != null) data['lastName'] = this.lastName;
    if (email != null) data['email'] = this.email;
    if (isVerified != null) data['isVerified'] = this.isVerified;
    return data;
  }
}
