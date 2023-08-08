import 'dart:convert';

class EmployeeModel {
  final int? id;
  final String? name;
  final String? group;
  final String? workingFrom;
  final String? workingTo;
  final String? vacationFrom;
  final String? vacationsTo;

  EmployeeModel({
    this.id,
    this.workingFrom,
    this.workingTo,
    this.name,
    this.group,
    this.vacationFrom,
    this.vacationsTo,
  });

  factory EmployeeModel.fromMap(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      workingFrom: json['workingFrom'],
      workingTo: json['workingTo'],
      name: json['name'],
      group: json['group'],
      vacationFrom: json['vacationFrom'],
      vacationsTo: json['vacationsTo'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['workingFrom'] = this.workingFrom;
    data['workingTo'] = this.workingTo;
    data['name'] = this.name;
    data['group'] = this.group;
    data['vacationFrom'] = this.vacationFrom;
    data['vacationsTo'] = this.vacationsTo;
    return data;
  }

  String toJson() => json.encode(toMap());
  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
