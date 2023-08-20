import 'dart:convert';

class EmployeeModel {
  final int? id;
  final String? name;
  final String? group;
  final String? workingFrom;
  final String? workingTo;
  final bool? isAvailable;
  final String? vacationFrom;
  final String? vacationsTo;
  final String? phone;

  EmployeeModel({
    this.id,
    this.workingFrom,
    this.workingTo,
    this.isAvailable,
    this.name,
    this.group,
    this.phone,
    this.vacationFrom,
    this.vacationsTo,
  });

  factory EmployeeModel.fromMap(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      workingFrom: json['workingFrom'],
      workingTo: json['workingTo'],
      isAvailable: json['isAvailable'],
      name: json['name'],
      group: json['group'],
      phone: json['phone'],
      vacationFrom: json['vacationFrom'],
      vacationsTo: json['vacationsTo'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['id'] = this.id;
    if (name != null) data['name'] = this.name;
    if (workingFrom != null) data['workingFrom'] = this.workingFrom;
    if (workingTo != null) data['workingTo'] = this.workingTo;
    if (isAvailable != null) data['isAvailable'] = this.isAvailable;
    if (phone != null) data['phone'] = this.phone;
    if (group != null) data['group'] = this.group;
    if (vacationFrom != null) data['vacationFrom'] = this.vacationFrom;
    if (group != null) data['group'] = this.group;
    if (vacationsTo != null) data['vacationsTo'] = this.vacationsTo;
    return data;
  }

  String toJson() => json.encode(toMap());
  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
