class EmployeeModel {
  final int? id;
  final String? name;
  final String? group;
  final String? workFrom;
  final String? workTo;

  EmployeeModel({
    this.id,
    this.workFrom,
    this.workTo,
    this.name,
    this.group,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
